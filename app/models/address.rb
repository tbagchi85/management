class Address < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :addressable, :polymorphic => true
end
