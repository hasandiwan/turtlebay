module BidPlaceholderHelper
  def bid_placeholder(item)
    if !item.top_bid.nil?
      number_to_currency(item.top_bid.amount).gsub("$", "")
    elsif !item.starting_bid.nil?
      number_to_currency(item.starting_bid).gsub("$", "")
    else
      "0.00"
    end
  end
end
