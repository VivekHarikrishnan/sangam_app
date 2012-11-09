class User < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :date_of_join, :father_name, :mother_name, :name, :password_hash, :password_salt, :password, :password_confirmation

  validates :name, presence: true
  validates :father_name, presence: true
  validates :mother_name, presence: true
  validates :date_of_birth, presence: true
  validates :date_of_join, presence: true
  validates :address, presence: true

  attr_accessor :password
  before_save :encrypt_password

  validates :password, confirmation: true

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

  def self.authenticate(name, password)
    user = find_by_name_and_is_admin(name, true)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end