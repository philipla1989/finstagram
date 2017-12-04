helpers do 
    def current_user
        User.find_by(id: session[:user_id])
    end
end

get '/posts/new' do
    @post = Post.new
    erb(:"posts/new")
end


get '/posts/:id' do
    @post = Post.find(params[:id])
    erb(:"posts/show")
end 


post '/posts' do
    photo_url = params[:photo_url]
    
    # instantiate new Post
    @post = Post.new({ photo_url: photo_url, user_id: current_user.id})
    
    #if @post valides, save
    if @post.save
        redirect(to('/'))
    else
        erb(:"posts/new")
    end
    
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/')
end


get '/login' do
    erb(:login)
end

post '/login' do
        username = params[:username]
    password = params[:password]
    
    user = User.find_by(username: username)
    
    if user && user.password == password
        session[:user_id] = user.id
        redirect to ('/')
    else
        @error_message = "Login failed"
        erb(:login)
    end
end


get '/' do
    @posts = Post.order(created_at: :desc)
    erb(:index)
end

get '/signup' do
    @user = User.new
    erb(:signup)
end

post '/signup' do
    params.to_s
    
    #grab user input values from params
    email       = params[:email]
    avatar_url  = params[:avatar_url]
    username    = params[:username]
    password    = params[:password]
    
        #instantiate and save a user
        @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password})
        
        # if user validations pass and user is saved
        if @user.save
            redirect to('/login')
        else
            erb(:signup)
        end
end