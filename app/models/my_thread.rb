class MyThread < ActiveRecord::Base
  belongs_to :category
  has_many :tweets

end
