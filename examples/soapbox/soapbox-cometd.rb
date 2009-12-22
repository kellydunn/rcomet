$:.unshift( "../../lib" )
require 'rcomet'

RComet::Server.new( :host => '0.0.0.0', :port => 8990, :mount => '/', :server => :mongrel ) {
  channel['/login'].callback do |message|
    puts "someone send "
    p message['data']
    puts 'on channel /login'
    channel["/from/#{message['data']}"]
  end
}.start

while true
end
