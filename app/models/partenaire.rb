class Partenaire < ActiveRecord::Base
  validates_presence_of :titre, :name, :logo
   has_one :entry, as: :destination_content, dependent: :destroy

  after_create :associate_entry

  def associate_entry
    self.create_entry name: "#{self.class.model_name.human}: #{self.name}", container: Container.first, title: self.title, permalink: "partenaire-#{self.id}"
  end

end
