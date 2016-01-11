# Create Users
10.times {
  User.create!(
    username: Faker::Internet.user_name,
    email:    Faker::Internet.email,
    password: "password"
  )
}

users = User.all

users.each do |user|
  10.times do |t|
    start_time = Faker::Time.between(DateTime.now - 7, DateTime.now, :morning)
    case t
    when (0..2)
      start_time -= 7.days
      end_time = Faker::Time.between(start_time, start_time + 7.days, :evening)
    when (3..6)
      end_time = Faker::Time.between(start_time, start_time + 7.days, :evening)
    else
      start_time += 3.days
      end_time = Faker::Time.between(start_time, start_time + 7.days, :evening)
    end
    user.items.create(
      title: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      start_time: start_time,
      end_time: end_time,
      starting_bid: rand(1.0...5.0).round(2)
    )
  end
end

items = Item.all

items.each do |item|
  bid_amount = 5.00
  rand(1..5).times do
    new_bid = item.bids.build(bidder: users.sample, amount: bid_amount)
    if new_bid.bidder != new_bid.item.seller
      new_bid.save!
    end
    bid_amount += rand(1.0..5.0).round(2)
  end
end
