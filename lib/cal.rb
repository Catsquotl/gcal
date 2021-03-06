require 'google_calendar'
require 'csv'
require_relative '../data/credentials'
require_relative 'shift'

class Cal

  attr_reader :calendar, :schedule

  def initialize(opts)
    @calendar = opts[:calendar] ||= Google::Calendar.new(Credential::cred)
    @schedule_file = opts[:schedule_file]
    @schedule = []
    get_shifts
  end

    def get_shifts
      CSV.foreach(File.expand_path @schedule_file, File.dirname(__FILE__)) do |shift|
        @schedule.push Shift.new(shift[0],shift[1])
      end
    end

  def save_schedule
    @schedule.each do |ev|
      @calendar.save_event ev.event
    end
  end
end
