require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
require('./lib/player.rb')
require('./lib/team.rb')
require('pry')

use Rack::Session::Cookie, expire_after: 10

get('/') do
  @user_type = session[:user_type]
  if session[:user_type] == 'lm'
    erb(:lm_index)
  elsif session[:user_type] == 'tc'
    erb(:tc_index)
  else
    erb(:index)
  end
end


post('/lm') do
  session[:user_type] = params[:user_type]
  redirect '/lm'
end

get('/lm') do
  @user_type = session[:user_type]
  erb(:lm_index)
end

post('/tc') do
  @teams = Team.all()
  session[:user_type] = params[:user_type]
  redirect('/teams')
end

get('/teams') do
  @user_type = session[:user_type]
  @teams = Team.all()
  erb(:teams)
end

get('/teams/new') do
  erb(:team_form)
end

post('/teams') do
  name = params[:name]
  @team = Team.create({name: name})
  redirect("/team/#{@team.id()}")
end

get('/team/:id') do
  @teams = Team.all()
  @user_type = session[:user_type]
  @team = Team.find(params["id"])
  erb(:team)
end
