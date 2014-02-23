Launcher Ipsum
==============

Launcher Ipsum is a small program that generates Lorem Ipsum-like text but uses a NASA dictionary instead.
There are actually 3 small methods that I inadvertantly made just to get the information:
- nasa_download.rb (now a part of dictionary_populate.rb) : Downloads the HTML files for each letter of the alphabet
- dictionary_populate.rb : Parses the HTML files looking for word entries, and then strips the junk characters and saves the information in a more searchable way.
- launch_ipsum.rb : Actually generates the ipsum based on the words in dictionary.md. Paragraph and sentence length are randomly selected. Amount of paragraphs are selected by user. Allows for file validation of the dictionary file, the dictionary_populate file, and the HTML files.
