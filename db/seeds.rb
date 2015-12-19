# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times { User.create!( username: Faker::Internet.user_name, email: Faker::Internet.email, password:"password" )}

users = User.all

users.each do |user|
  10.times do
    user.items.build(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph,
      start_time: Faker::Time.between(DateTime.now - 3, DateTime.now),
      end_time: Faker::Time.forward(14, :evening),
      starting_bid: rand(5.0..200.0).round(2)
    )
    user.items.last.save
  end
end

items = Item.all

items.each do |item|
  bid_amount = 5.00
  rand(1..15).times do
    new_bid = item.bids.build(bidder_id: rand(1..10), amount: bid_amount)
    if new_bid.bidder != new_bid.item.seller
      new_bid.save!
    end
    bid_amount += 5.00
  end
end