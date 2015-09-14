class Category < ActiveRecord::Base
  has_many :tweets
  has_many :my_threads
end
