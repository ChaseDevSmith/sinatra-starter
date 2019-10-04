
class ApplicationController < Sinatra::Base
  set :views, "./app/views"

  get '/' do
    # Player.create({
    #   name: params[:new_user]
    # })
    @users = Player.all
    erb :index
  end
  get "/new-user" do
   
    erb :new_user
    
  end
  post '/new-user' do
    Player.create({
      name: params[:new_user],
      wins: 0,
      losses: 0
    })
  
    
   redirect "/"
  end

  post('/next-thing') do 
    @player1 = Player.find_by(name: params[:player_one])
    @player2 = Player.find_by(name: params[:player_two])
  
    erb :"match-results"
  end

  post "/tally" do

    # binding.pry
    @player1 = Player.find_by(id: params[:player_win])
    
    @player1.update( wins: @player1.wins + 1)

    @player2 = Player.find_by(id: params[:player_lose])

    @player2.update( losses: @player2.losses + 1)

    erb(:tally)

  end 

  get "/match-results"  do 
    
   
    erb :"match-results"
    
  end 
  post "match-results" do
    #something that adds a win or loss

  end 
 
end