# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

IMAGES = [
  'dummy1.jpg',
  'dummy2.jpg',
  'dummy3.jpg',
  'dummy4.jpg',
  'dummy5.jpg',
  'dummy6.jpg',
  'dummy7.jpg',
  'dummy8.jpg',
  'dummy9.jpg',
  'dummy10.jpg',
  'dummy12.jpg',
  'dummy13.jpg',
  'dummy14.jpg',
  'dummy15.jpg',
  'dummy16.jpg',
  'dummy17.jpg',
  'dummy18.jpg',
  'dummy19.jpg',
  'dummy20.jpg',
  'dummy21.jpg',
  'dummy22.jpg',
  'dummy23.jpg',
  'dummy24.jpg'
]

8.times do
  band = Band.new(name: Faker::Pokemon.name)
  band.save
  [2,3].sample.times do
    album = Album.new(
      title: Faker::Ancient.god,
      year: (1986..2017).to_a.sample,
      band_id: band.id,
      studio?: [true, true, true, true, false].sample,
      image: IMAGES.shuffle.pop
    )
    album.save
    i = 1

    [1,2,3,5,6,9,12,18].sample.times do
      track = Track.new(
        title: Faker::Hipster.word,
        ord: i,
        lyrics: Faker::Hipster.paragraph(2),
        bonus?: [false, false, false, false, false, false, true].sample,
        album_id: album.id
      )
      track.save
      i += 1
    end
  end
end


user = User.new(
  email: "123" ,
  password_digest: BCrypt::Password.create("password"),
  session_token: SecureRandom::urlsafe_base64,
  activation_token: SecureRandom::urlsafe_base64,
  activated: true,
  admin: true
  )
user.save
