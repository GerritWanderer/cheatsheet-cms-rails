class Cheat < ActiveRecord::Base
  belongs_to :category
  has_many :blocks
  
  attr_accessible :name, :preview, :position, :category_id
  validates :name,  :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
end