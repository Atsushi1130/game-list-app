class Post < ApplicationRecord

    validates :review, {presence: true}
    validates :article, {presence: true}
end
