require 'pry'

def get_lines
	counter = 1
	File.open("dictionary.md").each do |line|
		counter += 1
	end
	counter
end

def get_sentence lines
	words_per_sentence = rand(5..10)
	words_ctr = 0
	sentence = []

	while words_ctr < words_per_sentence
		random_line = ":" + rand(lines).to_s + ":" # returns line number in format of 123:

		File.open("dictionary.md").each do |line|
			if line.include?(random_line)
				sentence << line.gsub(/(\:\d*\:\s)/, '').chomp
			end
		end

		words_ctr += 1
	end

	sentence[0].capitalize!
	sentence
end

def get_paragraph lines
	sent_per_paragraph = rand(4..12)
	sent_ctr = 0
	single_paragraph = []

	while sent_per_paragraph > sent_ctr
		single_paragraph << get_sentence(lines)
		sent_ctr += 1
	end

	single_paragraph
end

# ----------------------------
# ------ Method Barrier ------
# ----------------------------

puts "Launcher Ipsum"
ipsum = []

lines = get_lines() - 1

print "How many paragraphs do you need? "

num_paragraphs = gets.chomp.to_i
puts "---------------------------------"

# Build paragraphs
loop_ctr = 0
while loop_ctr < num_paragraphs
	ipsum << get_paragraph(lines)
	loop_ctr += 1
end


ipsum.each do |para|
	print "\t"
	para.each do |sent|
		print sent.join(' ') + '. '
	end
	puts
end
