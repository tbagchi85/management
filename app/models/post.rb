class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title, :body
  belongs_to :user, :dependent => :destroy, :autosave => true
  has_many :comments, :as => :commentable
end
