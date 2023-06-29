# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ApplicationRecord.transaction do
  # These `destroy_all` commands are not necessary--but will also not hurt--if
  # you use `rails db:seed:replant`.
  puts 'Destroying tables...'
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  # Reset the id (i.e., primary key) counters for each table to start at 1
  # (helpful for debugging)
  puts 'Resetting id sequences...'
  %w(users artworks artwork_shares).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end
  
  # Create seed data
  puts 'Loading seed data...'
  u1 = User.create!(username: 'Dominic')
  u2 = User.create!(username: 'Stefan')
  u3 = User.create!(username: 'Darren')
  u4 = User.create!(username: 'Taylor')
  u5 = User.create!(username: 'Diego')
  u6 = User.create!(username: 'Abby')
  
  a1 = Artwork.create!(title: 'Mona Lisa', image_url: 'https://en.wikipedia.org/wiki/Mona_Lisa', artist_id: 1)
  a2 = Artwork.create!(title: 'The Starry Night', image_url: 'https://en.wikipedia.org/wiki/The_Starry_Night', artist_id: 2)
  a3 = Artwork.create!(title: 'Sunflowers', image_url: 'https://en.wikipedia.org/wiki/Sunflowers_(Van_Gogh_series)', artist_id: 1)
  a4 = Artwork.create!(title: 'The Kiss', image_url: 'https://en.wikipedia.org/wiki/The_Kiss_(Klimt)', artist_id: 4)
  a5 = Artwork.create!(title: 'The birth of Venus', image_url: 'https://en.wikipedia.org/wiki/The_Birth_of_Venus', artist_id: 3)
  a6 = Artwork.create!(title: 'The Last Supper', image_url: 'https://en.wikipedia.org/wiki/The_Last_Supper_(Leonardo)', artist_id: 2)
  a7 = Artwork.create!(title: 'American Gothic', image_url: 'https://en.wikipedia.org/wiki/American_Gothic', artist_id: 2)

  as1 = ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
  as2 = ArtworkShare.create!(artwork_id: 7, viewer_id: 1)
  as3 = ArtworkShare.create!(artwork_id: 7, viewer_id: 3)
  as4 = ArtworkShare.create!(artwork_id: 4, viewer_id: 5)
  as5 = ArtworkShare.create!(artwork_id: 2, viewer_id: 6)
  as6 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
  as7 = ArtworkShare.create!(artwork_id: 5, viewer_id: 3)

  puts 'Done!'
end
