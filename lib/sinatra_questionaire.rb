require 'rubygems'
require 'sinatra'

get '/' do
  redirect to('/index')
end

get '/index' do
  erb :index
end 

post '/show' do    
  answer_score = params[:post].flatten.select { |item| item.match(/\-?[012]/) }.map { |item| item.to_i }.inject{ |sum,x| sum + x }
  
  if(answer_score > 10)
    @party_affiliation = "Strong Democrat"
  elsif(answer_score <= 10 && answer_score >= 5)
    @party_affiliation = "Moderate Democrat"
  elsif(answer_score <= 4 && answer_score >= -4)
    @party_affiliation = "Moderate"
  elsif(answer_score <= -5 && answer_score >= -10)
    @party_affiliation = "Moderate Republican"
  else
    @party_affiliation = "Strong Republican"
  end
  
  erb :show
end