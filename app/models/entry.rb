class Entry < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  validates_presence_of :name, :permalink
  validates_uniqueness_of :name, :permalink

  belongs_to :container
  belongs_to :destination_content, polymorphic: true

  before_save :update_path_cache
  def self.salable_items
        find(:all)
  end
  def destination_path
    path_cache
  end

  def destination_as_params
    result = HashWithIndifferentAccess.new({})
    if self.destination_action =~ /#/
      result[:controller], action_with_params = self.destination_action.split "#"
      result[:action], params = action_with_params.split "?"
      if params
        params.split("&").each do |kv|
          k, v = kv.split "="
          result[k.to_sym] = v
        end
      end
    elsif self.destination_content
      result[:controller] = self.destination_content.class.to_s.tableize
      result[:action] = "show"
      result[:id] = self.destination_content.to_param
    end
    if result.is_a? Hash
      result[:container_id] = self.container_id
      result[:entry_id] = self.id
      result[:only_path] = true
    end
    result
  end

  private

  def update_path_cache
    self.path_cache = url_for(self.destination_as_params)
  end
end
