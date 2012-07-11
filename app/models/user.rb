class User < ActiveRecord::Base
  attr_accessible(:full_name, :email)
  validates(:full_name, :presence => true)  # attr_accessible :title, :body
  validates(:email, :presence => true, :uniqueness => true)
end
