class Post < ActiveRecord::Base
    validates :title, presence: true #performs if it's invalid with no title
    validates :content, length: {minimum: 50} #performs if it's invalid with too short content
    validates :summary, length: {maximum: 100} #performs if it's invalid with a long summary
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) } #performs if it's invalid with a category outside the choices
    validate :clickbait?

    @@clickbait_title = [ /Won't Believe/, /Secret/, /Top[0-9]/, /Guess/ ]

    def clickbait?
        if @@clickbait_title.none? { |click| click.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
