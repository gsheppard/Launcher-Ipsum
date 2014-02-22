alpha = 'a'
dictionary_filename = "pages/dictionary.md"

counter = 1
File.open(dictionary_filename, "w") do |dict_file|
	while alpha != 'z'.next
		File.open("pages/nasa_#{alpha}.html").each do |line|
			line = line.encode("US-ASCII", :invalid => :replace, :undef => :replace, :replace => "?")

			if line.include?("<DT><STRONG>")
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
