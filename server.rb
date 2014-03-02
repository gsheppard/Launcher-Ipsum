require 'sinatra'
require 'shotgun'
require 'pry'
load 'launch_ipsum.rb'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

lines = get_lines()

get '/' do
  @num_paragraphs = 0
  erb :ipsum
end

post '/' do
  @num_paragraphs = params[:paragraphs].to_i
  @ipsum = build_paragraphs(lines, @num_paragraphs)
  erb :ipsum
end
