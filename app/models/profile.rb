class Profile < ActiveRecord::Base
  attr_accessible :initial, :first_name, :last_name, :parents_name, :gender, :dob, :address
  #attr_accessor :address
  belongs_to :user
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address, :allow_destroy => true
  def full_name
    last_name.blank? || last_name.nil? ? "#{first_name}" : "#{initial} #{first_name} #{last_name}"
  end
end
