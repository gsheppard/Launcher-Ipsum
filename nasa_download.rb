require 'rubygems'
require 'rest-client'

alpha ||= 'a'
nasa_url = "http://er.jsc.nasa.gov/seh/"
nasa_local_filename = "pages/nasa_"

while alpha != 'z'.next
	File.open("#{nasa_local_filename}#{alpha}.html", "w") do |file|
	   file.write(RestClient.get("#{nasa_url}#{alpha}.html"))
	end

	alpha.next!
end
