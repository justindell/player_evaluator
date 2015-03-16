require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

teams = Sequel.sqlite('players.sqlite')[:teams]

teams.delete
doc = Nokogiri::HTML(open('http://www.sports-reference.com/cbb/schools/'))
doc.css('table#schools tr').each do |school|
  next unless school.search('td')[3] && school.search('td')[3].inner_html == '2015'
  school_id = school.search('td a')[0][:href].split('/').last
  school_name = school.search('td a')[0].inner_html
  teams.insert(:name => school_name, :reference_id => school_id)
  puts "added #{school_name}"
end

teams.each do |team|
  doc = Nokogiri::HTML(open("http://www.sports-reference.com/cbb/schools/#{team[:reference_id]}/"))
  alternate_name = doc.css('#info_box p').first.inner_html
  next unless alternate_name.match /Also known as: /
  alternate_name = alternate_name.gsub(/Also known as: /, '')
  puts "setting #{alternate_name} as an alternate name for #{team[:name]}"
  teams.where(:id => team[:id]).update(:alternate_name => alternate_name)
end
