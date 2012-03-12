class Container < ActiveRecord::Base
  validates_presence_of :name, :layout
  has_many :entries
  has_many :container_navigations
  has_many :navigations, through: :container_navigations
end
