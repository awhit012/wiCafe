enable :sessions
#require 'gr_avatar'

get '/' do
  # p "GET: / - Root Homepage"
  if logged_in?
  	redirect( "/profile" )
  else
 		erb :index
  end
end


get '/cafes' do
  @hosts = User.hosts
	erb :cafes
end

# USER CONTROLER

post '/users/create' do
  @user = User.create(name: params[:name], email: params[:email])
  @user.password_hash = params[:password_hash]
  @user.save!

  session[:id] = @user.id

  redirect '/profile'
end

post '/users/login' do
  #sign-in, create session
  @user = User.where(email: params[:email]).first
  if @user.password_hash == params[:password_hash]
    session[:id] = @user.id
  end
  #redirect( "/#{current_user.email}/profile" )
  redirect( "/profile" )
end

get '/profile' do
  @user = User.find(session[:id])
  #@gravatar = "#{@user.email}".gravatar.to_s
  erb :profile
end

get '/profile/edit' do
  erb :edit_profile
end

get '/logout' do
  session.clear
  redirect( "/")
end

get '/newhost' do
  erb :hostform
end

post '/newhost/update' do
  @user = User.find(session[:id])
  @user.update_attributes!(params)
  @user.save
  redirect("/profile")
end
