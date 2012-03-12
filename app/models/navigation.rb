class Navigation < ActiveRecord::Base
  has_many :navigation_entries
  has_many :entries, through: :navigation_entries

  has_many :container_navigations
  has_many :containers, through: :container_navigations

  validates_presence_of :name
end
