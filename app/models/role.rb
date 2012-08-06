class Role < ActiveRecord::Base
  attr_accessible :role_type
  has_and_belongs_to_many :users
end
