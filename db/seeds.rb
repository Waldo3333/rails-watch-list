require 'open-uri'
require 'JSON'

url = "https://tmdb.lewagon.com/movie/top_rated"

response = URI.open(url).read
data = JSON.parse(response)

index = 0

Bookmark.destroy_all
Movie.destroy_all

30.times do
  Movie.create!(title: "#{data["results"][index]["title"]}", overview: "#{data["results"][index]["overview"]}", poster_url: "https://image.tmdb.org/t/p/original/#{data["results"][index]["poster_path"]}", rating: "#{data["results"][index]["vote_average"]}")
  index = index + 1
  puts "#{index} movie created"
end
