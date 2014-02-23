require 'rubygems'
require 'rest-client'

def nasa_download
	alpha ||= 'a'
	nasa_url = "http://er.jsc.nasa.gov/seh/"
	nasa_local_filename = "pages/nasa_"

	while alpha != 'z'.next

		unless File.exist?("#{nasa_local_filename}#{alpha}.html")
			File.open("#{nasa_local_filename}#{alpha}.html", "w") do |file|
			   file.write(RestClient.get("#{nasa_url}#{alpha}.html"))
			end
		end

		alpha.next!
	end
end
