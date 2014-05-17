require 'google_calendar'
require_relative './get_shifts'

class Cal

  attr_reader :calendar
  shiftfile = '../test/data/testevents.csv'

  def initialize credentials, shiftfile = shiftfile
    @calendar = Google::Calendar.new(credentials)
    list = GetShifts.new(File.expand_path shiftfile, File.dirname(__FILE__))
    list.get_shifts
    schedule_creator list.shifts
  end

  def schedule_creator event_list
    event_list.each do |ev|
      @calendar.save_event ev.event
    end

  end
end
