
Bundler.require



get '/say/*/to/*' do |message,dest|
 params['splat'] # => ["hello", "world"]
end

get '/download/*.*' do |path, ext|
 [path, ext] # => ["path/to/file", "xml"]
end

get %r{/hello/([\w]+)} do
 "Hello, #{params[:captures].first}"
end

get %r{/users/([\w]*)/([0-9]*)} do |name, id|
 "i
 user name = #{name}, \r\n
 user id = #{id}"
end

get '/posts/:format?' do |format|
 "You specfied format #{format}"
end


get '/guests', :agent => %r{Gozilla\/([\d]*)\.([\d]*)([/w]*)?} do
 "Use version #{params['agent'][0]}.#{params['agent'][1]} on Mozilla."
end

get '/guests' do
 request.user_agent          # => User Agent
 request.host                # => Localhost

end

get '/admin', :host_name => %r{^?} do
 "Permission denied : for administrator only"
end

#get '/setting/*', :provides => 'html' do
# @title = 'Hello,World'
# @subtitle = 'Hello,World'
# haml :index
#end

set(:probability) { |value| condition {rand <= value} }

get '/win_a_car', :probability => 0.5 do
 "WIN"
end

get '/win_a_car' do
 "LOSE"
end




