require "sinatra"
require "rack-flash"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  get "/" do
    if session[:user] != []
      erb :logged_in
    else
      erb :root
    end
  end

  get "/registration" do
    erb :registration
  end

  post "/registration" do
    username = params[:username]
    password = params[:password]
    @user_database.insert({username: username, password: password})
    flash[:notice] = "Thanks for registering!"
    redirect '/'
  end

  post "/login" do
    active_user = @user_database.all.find do |user_hash|
      params[:username] == user_hash[:username] && params[:password] == user_hash[:password]
    end
    if active_user != []
      session[:user] = active_user[:id]
      redirect '/'
    else
      flash[:notice] = "Yikes! User and password not found."
    end
  end

  get '/logout' do
    session[:user] = []
    redirect '/'
  end

end
