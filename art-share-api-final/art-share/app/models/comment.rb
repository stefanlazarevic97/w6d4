# == Schema Information
#
# Table name: comments
#
#  id                   :bigint           not null, primary key
#  body                 :text             not null
#  commenter_id         :bigint           not null
#  artwork_commented_id :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :commenter,
        class_name: :User

    belongs_to :artwork_commented,
        class_name: :Artwork

    def self.comments_by_user_id(user_id)

    end
       
    def self.comments_by_artwork_id(artwork_id)

    end
end
