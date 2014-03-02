require 'sinatra'
require 'shotgun'
require 'pry'
load 'launch_ipsum.rb'

lines = get_lines()
# ipsum = build_paragraphs(lines, 4)

get '/' do

  erb :index
end

post '/ipsum' do
  @num_paragraphs = params[:paragraphs].to_i
  @ipsum = build_paragraphs(lines, @num_paragraphs)
  erb :ipsum
end
