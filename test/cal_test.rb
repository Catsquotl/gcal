require_relative '../test_helper'
require_relative '../lib/cal'
require_relative '../lib/credentials'

describe Cal do

  before do
    credentials = Credentials.new.credentials
    @shiftfile = '../test/data/testevents.csv'
    @cal = Cal.new(credentials, @shiftfile)
  end
  
  it 'must have a valid Google::Calendar object' do
    @cal.calendar.must_be_instance_of Google::Calendar
  end

  it 'must get a list of shifts from a file' do
    @cal.schedule[0].must_be_instance_of Shift
  end

end

