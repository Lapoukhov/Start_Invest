class Tttag < ApplicationRecord

  has_many :tttaggings
  has_many :projects, through: :tttaggings

  def self.counts
    self.select("name")
  end

end
