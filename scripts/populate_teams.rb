require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'
require 'date'

teams = Sequel.sqlite('players.sqlite')[:teams]

teams.delete
doc = Nokogiri::HTML(open('https://www.sports-reference.com/cbb/schools/'))
doc.css('table#schools tbody tr').each do |school|
  next unless school.search('td')[3] && school.search('td')[3].inner_html == Date.today.year.to_s
  school_id = school.search('td a')[0][:href].split('/').last
  school_name = school.search('td a')[0].inner_html
  teams.insert(:name => school_name, :reference_id => school_id)
  puts "added #{school_name}"
end

teams.each do |team|
  doc = Nokogiri::HTML(open("https://www.sports-reference.com/cbb/schools/#{team[:reference_id]}/"))
  alternate_name = doc.css('#info_box p').first
  next unless alternate_name
  alternate_name = alternate_name.inner_html
  next unless alternate_name.match /Also known as: /
  alternate_name = alternate_name.gsub(/Also known as: /, '')
  puts "setting #{alternate_name} as an alternate name for #{team[:name]}"
  teams.where(:id => team[:id]).update(:alternate_name => alternate_name)
end
