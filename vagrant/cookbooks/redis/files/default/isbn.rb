#---
# Excerpted from "Seven Databases in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rwdata for more book information.
#---
LIMIT = 1.0 /0 # 1.0/0 is Infinity in Ruby
# %w{rubygems hiredis redis/connection/hiredis}.each{|r| require r}
%w{rubygems time redis}.each{|r| require r}

# $redis = Hiredis::Connection.new
# $redis.connect("127.0.0.1",6379)
$redis = Redis.new(:host => "127.0.0.1", :port => 6379)
$redis.flushall
count, start = 0, Time.now
File.open(ARGV[0]).each do |line|
  count += 1
  next if count == 1
  isbn, title = line.scrub.split(";")
  next if isbn.empty? || title == "\n"

  # $redis.write ["SET", isbn, title]
  $redis.set(isbn, title)

  # set the LIMIT value if you do not wish to populate the entire dataset
  break if count >= LIMIT
end
puts "#{count} items in #{Time.now - start} seconds"

