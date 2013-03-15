class MenuItem < ActiveRecord::Base
  belongs_to :menu
  attr_accessible :description, :name, :price
end
