
Bundler.require 

get '/' do
	@title = "Hello World!"
	erb :index
end

get '/erp/oncode' do
	code ="<%= Time.now %>"
	erb code
end

get '/haml' do
	haml :index
end

get '/haml/oncode' do
	haml '%div.title Hello World'
end



