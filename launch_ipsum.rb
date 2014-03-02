require 'pry'

def get_lines
	counter = 0
	File.open("dictionary.md").each do |line|
		counter += 1
	end
	counter
end

def get_paragraph lines
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

		sentence[0].capitalize!
		single_paragraph << sentence
		sent_ctr += 1
	end

	single_paragraph
end

def build_paragraphs lines, num_paragraphs
	ipsum = []
	loop_ctr = 0
	while loop_ctr < num_paragraphs.to_i
		ipsum << get_paragraph(lines)
		loop_ctr += 1
	end
	ipsum
end
