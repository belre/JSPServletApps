
Bundler.require

class Stream
	def each
		100.times { |i| yield "#{i}\n<br>" }
	end
end

"<html><body>"
get('/') { Stream.new }
"</body></html>"
