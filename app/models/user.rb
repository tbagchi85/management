class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_and_belongs_to_many :roles
  has_one :student,  :dependent => :destroy, :autosave => true
  has_one :profile, :dependent => :destroy, :autosave => true
  has_many :posts
  has_many :comments
  has_many :addresses
end
