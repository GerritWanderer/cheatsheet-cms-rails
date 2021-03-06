class Sheet < ActiveRecord::Base
  belongs_to :user
  has_many :categories
  attr_accessible :name, :description, :user_id
  validates :name,  :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
end