require 'google_calendar'
require 'csv'
require_relative 'credentials'
require_relative 'shift'

class Cal

  attr_reader :calendar

  def initialize(credentials, shiftfile)
    @calendar = Google::Calendar.new(credentials)
    @shiftfile = shiftfile
    @shifts = []
    get_shifts
  end

    def get_shifts
      CSV.foreach(File.expand_path @shiftfile, File.dirname(__FILE__)) do |shift|
        @shifts.push Shift.new(shift[0],shift[1])
      end
    end

  def save_schedule
    @shifts.each do |ev|
      @calendar.save_event ev.event
    end
  end
end

if __FILE__ == $0
  credentials = Credentials.new.credentials
  shiftfile = '../test/data/testevents.csv'
  @cal = Cal.new(credentials,shiftfile)
  #@cal.save_schedule
end