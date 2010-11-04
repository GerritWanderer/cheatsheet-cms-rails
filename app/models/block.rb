class Block < ActiveRecord::Base
  belongs_to :cheat
  serialize :content
end