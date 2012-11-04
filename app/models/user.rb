class User < ActiveRecord::Base
  attr_accessible :address, :date_of_birth, :date_of_join, :father_name, :mother_name, :name
end
