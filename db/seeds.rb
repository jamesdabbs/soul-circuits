# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!(username: "DJ JD", email: "jamesdabbs@gmail.com", role: "dj", password: "password")

u.playlists.create!([{"id"=>1,
  "title"=>"Feed the Animals",
  "audio_url"=>
   "http://s3.amazonaws.com/soul-circuits/DJ-JD-Feed-the-Animals-1410065747",
  "photo_url"=>
   "http://s3.amazonaws.com/soul-circuits/DJ-JD-Feed-the-Animals-cover-1410065747",
  "like_count"=>55,
  "share_count"=>975,
  "play_count"=>4455,
  "payout"=>783},
 {"id"=>2,
  "title"=>"Night Ripper",
  "audio_url"=>"http://s3.amazonaws.com/soul-circuits/DJ-JD-Night-Ripper-1410065813",
  "photo_url"=>
   "http://s3.amazonaws.com/soul-circuits/DJ-JD-Night-Ripper-cover-1410065813",
  "like_count"=>269,
  "share_count"=>412,
  "play_count"=>1501,
  "payout"=>nil},
 {"id"=>3,
  "title"=>"Anatidaephobia",
  "audio_url"=>"http://s3.amazonaws.com/soul-circuits/DJ-JD-Anatidaephobia-1410065881",
  "photo_url"=>
   "http://s3.amazonaws.com/soul-circuits/DJ-JD-Anatidaephobia-cover-1410065881",
  "like_count"=>331,
  "share_count"=>719,
  "play_count"=>3467,
  "payout"=>645}])
