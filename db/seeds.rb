# frozen_string_literal: true

merchants = File.read("db/seed-files/merchants.json")
orders = File.read("db/seed-files/orders.json")
shoppers = File.read("db/seed-files/shoppers.json")

JSON.parse(merchants)["RECORDS"].each do |merchant|
  Merchant.create(merchant)
end

JSON.parse(orders)["RECORDS"].each do |order|
  Order.create(order)
end

JSON.parse(shoppers)["RECORDS"].each do |shopper|
  Shopper.create(shopper)
end
