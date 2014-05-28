require_relative '../test_helper'
require_relative '../lib/shift'

describe Shift do

  before do
    @sh = Shift.new('25-01','DI')
    @ex = Shift.new('28-05','dd')
  end

  it 'must accept a date and a shift' do
    @sh.shift_code.must_equal 'DI'
    @sh.date.must_equal '25-01'
  end

  it "must set correct DateTime's for events" do
    @sh.event.title.must_equal 'DI'
    @sh.event.start_time.must_equal DateTime.new(2014,1,25,7,30,0,'+2').to_s
    @sh.event.end_time.must_equal DateTime.new(2014,1,25,15,15,0,'+2').to_s
  end

end
