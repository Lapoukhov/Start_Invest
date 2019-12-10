class Project < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :tttaggings, dependent: :destroy
  has_many :tttags, through: :tttaggings
  has_many :comments
  has_many :bonus
  belongs_to :category

  validates :title, :description, :money, :date, presence: true

  def all_tags
    self.tttags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tttags = names.split(',').map do |name|
      Tttag.where(name: name.strip).first_or_create!
    end
  end
end
