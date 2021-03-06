# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Album.destroy_all

50.times do |index|
  Album.create!(name: Faker::Music.unique.album,
                genre: Faker::Music.genre,
                year: Faker::Number.within(range: 1960..2012))
end

p "Created #{Album.count} albums"

Song.destroy_all

@albums = Album.all
@albums.each do |album|
  10.times do |index|
    Song.create!(name: Faker::Lorem.words.join(" "),
                  lyrics: Faker::Lorem.paragraphs(number: 5).join(" "),
                  album_id: album.id)
  end
end

p "Created #{Song.count} songs"
