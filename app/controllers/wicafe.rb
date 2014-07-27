enable :sessions

get '/' do
  # p "GET: / - Root Homepage"
  if logged_in?
  	redirect( "/#{current_user.username}/notes" )
  else 
 		erb :index
  end
end


get '/cafes' do 
	erb :cafes
end

post '/users/create' do
  "Hello World"
end

post '/users/login' do
  "Hello World"
end