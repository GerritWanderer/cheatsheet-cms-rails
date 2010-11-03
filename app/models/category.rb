class Category < ActiveRecord::Base
  belongs_to :sheet
  has_many :cheats
  
  attr_accessible :name, :column, :position, :sheet_id
  validates :name,  :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
end