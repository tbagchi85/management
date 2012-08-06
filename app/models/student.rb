class Student < ActiveRecord::Base
  attr_accessible :count, :key_id, :key_token, :section, :standard, :user_id
  belongs_to :user
  validates_presence_of :key_id, :key_token
end
