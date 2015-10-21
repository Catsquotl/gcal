require_relative '../test_helper'
require_relative '../lib/shift'

class Testshift < MiniTest::Test

  def setup
    @sh = Shift.new('25-01','DI')
    @ex = Shift.new('28-05','dD')
    @exc = Shift.new('27-05','dd')
  end

  def must_accept_a_date_and_a_shift
    @sh.shift_code.must_equal 'DI'
    @sh.date.must_equal '25-01'
    @ex.shift_code.must_equal "DD"
  end

  def must_set_correct_DateTimes_for_Google_Events
    @sh.event.title.must_equal 'DI'
    @sh.event.start_time.must_equal DateTime.new(2014,1,25,7,30,0).to_s
    @sh.event.end_time.must_equal DateTime.new(2014,1,25,15,15,0).to_s
    @ex.event.start_time.must_equal DateTime.new(2014,5,28,7,30,0).to_s
    @ex.event.end_time.must_equal DateTime.new(2014,5,28,15,15,0).to_s
    @exc.event.end_time.must_equal DateTime.new(2014,5,27,16,30,0).to_s
  end
end
