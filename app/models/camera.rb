class Camera < ApplicationRecord
  BRANDS = ['Sony', 'Canon', 'Nikon', 'Fujifilm']
  validates :brand, presence: true, inclusion: { in: BRANDS }
  validates :model, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Associations
  belongs_to :user
  has_many :reservations, dependent: :destroy

end
