class User < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :date_of_join, :father_name, :mother_name, :name

  validates :name, presence: true
  validates :father_name, presence: true
  validates :mother_name, presence: true
  validates :date_of_birth, presence: true
  validates :date_of_join, presence: true
  validates :address, presence: true

  START_BIRTH_YEAR = 1960
  START_JOIN_YEAR = 2011
  END_YEAR = Time.now.year
  ORDER = [:day, :month, :year]

  def dob
    date_of_birth.strftime("%d %b %Y")
  end

  def doj
    date_of_join.strftime("%d %b %Y")
  end
end
