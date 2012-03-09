class BlogPost < ActiveRecord::Base
  validates_presence_of :name, :title, :content
  has_one :entry, as: :destination_content

  after_create :associate_entry

  def associate_entry
    self.create_entry name: "#{self.class.model_name.human}: #{self.name}", container: Container.first, title: self.title, permalink: "blogpost-#{self.id}"
  end
end
