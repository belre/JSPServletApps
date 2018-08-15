

Bundler.require


require 'sinatra/reloader'
require 'active_record'
require 'rack/csrf'


use Rack::Session::Cookie, secret: "thisissomethingsecret"
use Rack::Csrf, raise: true

# Establish Connection to sqlite3
ActiveRecord::Base.establish_connection(
 adapter: 'sqlite3',
 database: './bbs.db'
)

class Comment < ActiveRecord::Base
 validates :body, presence: true
end


get '/' do
 @title = "My BBS"
 @comments = Comment.all
 erb :index
end

post '/create' do
 Comment.create(body: params[:body])
 redirect to('/')
end

post '/destroy' do  
 puts params[:_csrf]
 Comment.find(params[:id]).destroy
end

#get '/rmcomment' do
# if(params[:selcomment] != nil)
#  md = params[:selcomment].match(/chk(\d+)/)
#  if(md != nil) # com no is saved as md[1]
#   comm = Comment.find((md[1]).to_i(10))
#   comm.destroy
#  end 
# end

# redirect to('/')
#end

get '/rmcommentall' do
 Comment.destroy_all
 redirect to('/')
end

