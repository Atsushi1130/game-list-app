class Like < ApplicationRecord
	validates :postId,{presence: true}
	validates :userId,{presence: true}
end
