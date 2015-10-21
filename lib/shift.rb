require 'csv'
require 'google_calendar'

class Shift

  attr_reader :date, :shift_code, :event

  def initialize(date,shift)
    @shift_code =  shift.upcase
    @date = date
    @exception = DateTime::strptime("#{date}",'%d-%m')
    create_shift
  end

  def set_event
    @event = Google::Event.new(title: @shift_code,
                               start_time:@datetime[0],
                               end_time: @datetime[1]
                              )
  end

  private

  def create_shift
    get_shift_times
    set_event
  end

  def get_shift_times
    CSV.foreach(File.expand_path'../data/shiftcodes.csv',File.dirname(__FILE__)) do |row|
      if row[0] == @shift_code
        set_shift_times(row)
      end
    end
  end

  def set_shift_times row
    @datetime = []
    @times = row[1], row[2]
    @times.each do |t|
    @datetime << Time::strptime("#{@date} #{t}",'%d-%m %H:%M')
    end
  end
end
