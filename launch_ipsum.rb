require 'pry'

def get_lines
	counter = 0
	File.open("dictionary.md").each do |line|
		counter += 1
	end
	counter
end

def valid? answer
	answer.match(/\d/) ? true : false
end

def get_paragraph2 lines
	sent_per_paragraph = rand(4..12)
	sent_ctr = 0
	single_paragraph = []

	while sent_ctr < sent_per_paragraph
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

		single_paragraph << sentence
		sent_ctr += 1
	end

	single_paragraph
end

# ----------------------------
# ------ Method Barrier ------
# ----------------------------

puts "Launcher Ipsum"
ipsum = []

lines = get_lines()

print "How many paragraphs do you need? (1-20) "
num_paragraphs = gets.chomp

while num_paragraphs.to_i > 20 || num_paragraphs.to_i < 1 || !valid?(num_paragraphs)
	puts ">> That's not valid."
	print "How many paragraphs (within reason) do you need? (1-20) "
	num_paragraphs = gets.chomp
end

puts "---------------------------------"

# Build paragraphs
loop_ctr = 0
while loop_ctr < num_paragraphs.to_i
	ipsum << get_paragraph2(lines)
	loop_ctr += 1
end


ipsum.each do |para|
	print "\t"
	para.each do |sent|
		print sent.join(' ') + '. '
	end
	puts
end
