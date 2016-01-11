FactoryGirl.define do
  factory :item do
    title "Tests are Fun!"
    starting_bid 1.00
    start_time DateTime.now
    end_time DateTime.now + 5
    image { File.new(Rails.root.join('spec', 'support', 'images', 'test_image.png')) }
    seller

    factory :item_with_bids do
      after(:create) do |item|
        create(:bid, item: item)
      end
    end

  end
end

