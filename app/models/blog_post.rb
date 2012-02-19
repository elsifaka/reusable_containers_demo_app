class BlogPost < ActiveRecord::Base
  validates_presence_of :name, :title, :content
  has_one :entry, as: :content
end
