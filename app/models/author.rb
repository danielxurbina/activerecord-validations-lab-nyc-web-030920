class Author < ActiveRecord::Base
    validates :name, presence: true #performs if it's invalid with no name
    validates :phone_number, length: {minimum: 10} #performs if it's invalid with a short number
    validates :name, uniqueness: true #performs if it's invalid when non-unique
end
