require 'rubygems'
require 'rest-client'

def nasa_download
	alpha ||= 'a'
	nasa_url = "http://er.jsc.nasa.gov/seh/"
	nasa_local_filename = "pages/nasa_"

	# checks if directory exists
	unless Dir.exist?("pages")
		Dir.mkdir("pages")
	end

	# downloads HTML files if they don't already exist
	while alpha != 'z'.next

		unless File.exist?("#{nasa_local_filename}#{alpha}.html")
			File.open("#{nasa_local_filename}#{alpha}.html", "w") do |file|
			   file.write(RestClient.get("#{nasa_url}#{alpha}.html"))
			end
		end

		alpha.next!
	end
end


def populate
	alpha = 'a'
	dictionary_filename = "dictionary.md"

	# checks if HTML files exist before trying to build
	file_exists = true
	while alpha != 'z'.next
		unless File.exist?("pages/nasa_#{alpha}.html")
			file_exists = false
		end
		alpha.next!
	end

	if file_exists == false
		puts ">> 1 or more HTML files don't exist"
		puts "Downloading..."
		nasa_download()
		puts "Download done."
	end

	puts "Building dictionary..."
	# builds dictionary
	alpha = 'a'
	counter = 1
	File.open(dictionary_filename, "w") do |dict_file|
		while alpha != 'z'.next
			File.open("pages/nasa_#{alpha}.html").each do |line|
				line = line.encode("US-ASCII", :invalid => :replace, :undef => :replace, :replace => "?")

				if line.include?("<DT><STRONG>") && line.length < 100
					line.gsub!(/\<DT\>\<STRONG\>/, '') # Remove starting HTML tags
					line.gsub!(/(\<\/STRONG\>).*/, '') # Remove ending HTML tags and anything after them
					line.gsub!(/\(.*\).*/, '') # Remove parenthesis and anything between them
					line.gsub!(/^\s*/, '') # Remove something something whitespace
					line.gsub!(/[^a-zA-Z0-9\s]/, '') # remove anything that isn't a letter or digit
					line.gsub!(/\s*$/, '') # remove trailing white space
					dict_file.write ":#{counter.to_s}: #{line}\n"
					counter += 1
				end
			end

			alpha.next!
		end
	end

	puts "Build done."
end
