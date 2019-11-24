# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
# get '/pages/index', to: 'pages#index'
root to: 'pages#index'
# get '/messages/:id', to: 'messages#show'
get '/messages/:url', to: 'messages#show'
# post '/message', to: 'messages#create'
post '/link', to: 'message#create'
get '/', to: 'messages#new'
