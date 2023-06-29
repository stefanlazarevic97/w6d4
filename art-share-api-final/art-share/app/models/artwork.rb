# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: { scope: :title }

    belongs_to :artist,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer
end
