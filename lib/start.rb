require_relative 'cal'

puts 'Getting Calendar'
puts 'Please enter the path to your new schedule'

@shiftfile = $stdin.gets.chomp

begin
  raise ArgumentError unless File.exist?(@shiftfile)
rescue
   puts "oops, I can't find your shiftfile. This is where I am looking. #{File.expand_path @shiftfile}"
end

now = Cal.new({:schedule_file => "#{File.expand_path @shiftfile}"})
now.save_schedule
