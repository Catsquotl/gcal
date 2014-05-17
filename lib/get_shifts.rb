require 'csv'
require_relative './shift'


class GetShifts 

  attr_reader :shifts

  def initialize schedule
    @shifts = []
    @schedule = schedule
  end

  def get_shifts
    CSV.foreach(@schedule) do |x|
        @shifts.push Shift.new(x[0],x[1])
    end
  end
end

if __FILE__ == $0
  @ev = GetShifts.new '../test/data/testevents.csv'
  @ev.get_shifts
  @ev.shifts.each do |ev|
    puts ev.event
  end

end
