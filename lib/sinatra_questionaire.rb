require 'rubygems'
require 'sinatra'

get '/' do
  @title = 'Are You More Democratic or Republican? - Questionaire Form'
  erb :index
end 

post '/show' do
  @title = 'Are You More Democratic or Republican? - Questionaire Result'
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