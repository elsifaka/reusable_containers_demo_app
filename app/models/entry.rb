class Entry < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :container
  belongs_to :content, polymorphic: true
end
