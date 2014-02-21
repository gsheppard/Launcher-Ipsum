require 'pry'

alpha = 'a'
dictionary_filename = "pages/dictionary.md"

File.open(dictionary_filename, "w") do |dict_file|
	while alpha != 'z'.next
		File.open("pages/nasa_#{alpha}.html").each do |line|
			line = line.encode("US-ASCII", :invalid => :replace, :undef => :replace, :replace => "?")

			if line.include?("<DT><STRONG>")
				line.gsub!(/\<DT\>\<STRONG\>/, '')
				line.gsub!(/(\<\/STRONG\>).*/, '')
				line.gsub!(/\(.*\).*/, '')
				line.gsub!(/^\s*/, '')
				line.gsub!(/[^a-zA-Z0-9\s]/, "")
				dict_file.write line
			end
		end

		alpha.next!
	end
end
