class User < ActiveRecord::Base
after_save :clear_password
 
def clear_password
  self.password = nil
end 
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..50 }
  validates :password, :presence => true, :length => { :in => 3..500 } 
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_format_of :firstname, with: /\A([a-z]{2,})\Z/i, :on => :create
  validates_format_of :lastname, with: /\A([a-z]{2,})\Z/i, :on => :create
  # EMAIL_REGEX = '/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i'
end
