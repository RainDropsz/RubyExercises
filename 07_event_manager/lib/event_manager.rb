require "csv"
require 'erb'
require 'date'
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials

  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  phone_number = phone_number.to_s.split("").map{|p| p[/\d+/]}.join("")
  if phone_number.length == 10
    phone_number
  elsif phone_number.length == 11 && phone_number.to_s[0] == "1"
    phone_number[1..-1]
  else
    "0000000000"
  end
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
#template_letter = File.read "form_letter.erb"
#erb_template = ERB.new template_letter
hour_array = []
weekday_array = []

contents.each do |row|
=begin
  id = row[0]

  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
=end

#Clean Phone Numbers
  phone_number = clean_phone_number(row[:homephone])


#Find out which hours of the day the most people registered
  hour_array <<  DateTime.strptime(row[:regdate], "%m/%d/%y %k:%M").hour 
  weekday_array << DateTime.strptime(row[:regdate], "%m/%d/%y %k:%M").wday
end

hour_count = hour_array.reduce(Hash.new(0)) do |counts, hour|
  counts[hour] += 1
  counts
end

weekday_count = weekday_array.reduce(Hash.new(0)) do |counts, wday|
  counts[DateTime::ABBR_DAYNAMES[wday]] += 1
  counts
end

p hour_count.sort_by(&:last).reverse!
p weekday_count.sort_by(&:last).reverse!

