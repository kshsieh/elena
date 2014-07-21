class Event < ActiveRecord::Base
  validates_presence_of :date, :group_name, :venue_name
end