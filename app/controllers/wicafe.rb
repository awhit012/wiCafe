enable :sessions

get '/' do
  # p "GET: / - Root Homepage"
  if logged_in?
  	redirect( "/#{current_user.username}/profile" )
  else
 		erb :index
  end
end


get '/cafes' do
	erb :cafes
end

post '/users/create' do
  @user = User.create(name: params[:name], email: params[:email])
  @user.password_hash = params[:password_hash]
  @user.save!

  redirect '/'
end

post '/users/login' do
  #sign-in, create session
  @user = User.where(email: params[:email]).first
  if @user.password == params[:password_hash]
    session[:user_id] = @user.user_id
  end
  redirect( "/#{current_user.username}/profile" )
end
