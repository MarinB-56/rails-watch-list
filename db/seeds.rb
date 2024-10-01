require 'json'
require 'open-uri'

puts 'Erase database...'
Movie.destroy_all if Rails.env.development?

puts 'Fetch data from TMDB'

url = 'https://tmdb.lewagon.com/movie/popular?language=fr-FR'
user_serialized = URI.parse(url).read
user = JSON.parse(user_serialized)

puts 'Create movies...'
user['results'].each do |movie|
  puts movie['title']
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
end

# Movie.create(
#   title: 'Wonder Woman 1984',
#   overview: 'Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s',
#   poster_url: 'https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg',
#   rating: 6.9
# )

# Movie.create(
#   title: 'The Shawshank Redemption',
#   overview: 'Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison',
#   poster_url: 'https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
#   rating: 8.7)

# Movie.create(title: 'Titanic',
#   overview: '101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.',
#   poster_url: 'https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg',
#   rating: 7.9
# )

# Movie.create(
#   title: 'Ocean's Harr',
#   overview: 'Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.',
#   poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg', rating: 7.0
# )

# Movie.create(
#   title: 'Harry Potter',
#   overview: 'Super film qui raconte l'histoire d'un jeune socier qui arrive à Poudlard pour faire ses études !',
#   poster_url: 'https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg', rating: 8.3
# )
puts 'Movies created'
