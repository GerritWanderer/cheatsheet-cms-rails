class Cheat < ActiveRecord::Base
  belongs_to :block
  
  attr_accessible :name, :preview, :position, :block_id
  validates :name,  :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
end
