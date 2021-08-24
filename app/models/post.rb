class Post < ApplicationRecord

    validates :review, {presence: true}
    validates :article, {presence: true, length: {maximum: 140}}
end
