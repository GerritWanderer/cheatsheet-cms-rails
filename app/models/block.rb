class Block < ActiveRecord::Base
  belongs_to :sheet
  attr_accessible :name, :column, :position, :sheet_id
  validates :name,  :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
end