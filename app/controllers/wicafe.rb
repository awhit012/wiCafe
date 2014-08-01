enable :sessions

enable do
  ActiveRecord::Base.connection.close
end

get '/' do
  @users = User.all
  if logged_in?
  else
 		erb :index
  end
end

get '/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token
  @user = User.find_or_create_by(username: @access_token.params[:screen_name])
  @user.oauth_token = @access_token.token
  @user.oauth_secret = @access_token.secret
  if @user.name == nil
    @user["name"] = @user["user_name"]
  end

  @user.save

  session[:id]=@user.id

  redirect '/'
end

# USER CONTROLER

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
