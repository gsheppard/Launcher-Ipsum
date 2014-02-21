require 'pry'

dictionary_filename = "pages/dictionary.txt"

File.open(dictionary_filename, "w") do |dict_file|
	File.open("pages/nasa_a.html").each do |line|
		# binding.pry
		if line.include?("<DT><STRONG>")
			dict_file.write line
		end
	end
end
