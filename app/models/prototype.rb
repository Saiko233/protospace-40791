class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
