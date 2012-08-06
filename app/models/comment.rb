class Comment < ActiveRecord::Base
   attr_accessible :body
   validates_presence_of :body, :message => "Comment can't be blank"
  belongs_to :commentable, :polymorphic => true, :dependent => :destroy, :autosave => true
  belongs_to :user
end
