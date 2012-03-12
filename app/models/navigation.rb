class Navigation < ActiveRecord::Base
  has_many :navigation_entries
  has_many :entries, through: :navigation_entries

  validates_presence_of :name
end
