class Menu < ActiveRecord::Base
  attr_accessible :name
  has_many :menu_items, :dependent => :destroy
  validates :name, :presence => true, :uniqueness => true
end
