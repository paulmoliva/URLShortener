puts "Input your email"
email = gets.chomp
puts "visit url? or create? (v/c)"
ans = gets.chomp
if ans == 'c'
  puts 'what url to shorten?'
  long_url = gets.chomp
  short = ShortenedURL.create_for_user_and_long_url!(email, long_url)
  puts short.short_url
  Launchy.open("http://#{short.short_url}.fs.io")

else
  puts 'what url to visit?'
  i = 1
  ShortenedURL.all.each do |url|
    puts "#{i}) http://#{url.short_url}.fs.io"
    i += 1
  end
  ans = gets.to_i
  short_url = ShortenedURL.all[ans - 1].short_url
  Visit.record_visit!(email, short_url)
  Launchy.open("http://#{ShortenedURL.find_by_short_url(short_url).long_url}")
end
