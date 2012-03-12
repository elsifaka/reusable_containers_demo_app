class NavigationEntry < ActiveRecord::Base
  belongs_to :navigation
  belongs_to :entry
end
