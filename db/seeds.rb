require 'faker'

# --------CREATE USERS --------
5.times do 
  User.create(username:Faker::Internet.user_name, 
              password:'123')
end

# --------CREATE RECORDS --------
20.times do
  Record.create(albumtitle: Faker::Lorem.sentence,
                artist: Faker::Commerce.product_name,
                genre: ["rock","jazz","hip-hop","country","punk","edm"].sample,
                owneropinion: Faker::Lorem.paragraph,
                releaseyear: rand(1920..2015),
                user_id: rand(1..5))

end


# --------CREATE TRACKS --------
40.times do
  Track.create(title: Faker::Commerce.product_name,
                record_id: rand(1..20))

end

#--------CREATE COMMENTS ---------

20.times do
  Comment.create(body: Faker::Lorem.paragraph,
                user_id: rand(1..5),
                record_id: rand(1..20))
end