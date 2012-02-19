class Container < ActiveRecord::Base
  validates_presence_of :name, :layout
  has_many :entries
end
