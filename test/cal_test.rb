require_relative '../test_helper'
require_relative '../lib/cal'
require_relative '../data/credentials'

class TestCal < Minitest::Test

  def setup
    credentials = Credential.new
    @shiftfile = '../test/data/testevents.csv'
    @cal = Cal.new({:schedule_file => @shiftfile})
  end

  def test_Google_calendar_is_present
    assert_kind_of Google::Calendar, @cal.calendar
  end

  def test_cal_has_a_shiftfile
    refute_empty @cal.schedule
  end
end
