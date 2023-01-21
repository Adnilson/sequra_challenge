require "test_helper"

class DisbursementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index with 2 records" do
    shopper = Shopper.create(name: "James")
    merchant = Merchant.create(name: "Paula")
    order1 = Order.create(amount: 10.00, completed_at: DateTime.now, merchant: merchant, shopper: shopper)
    order2 = Order.create(amount: 10.00, completed_at: DateTime.now, merchant: merchant, shopper: shopper)
    Disbursement.create(amount: 9.90, merchant: merchant, order: order1)
    Disbursement.create(amount: 9.90, merchant: merchant, order: order2)

    get root_url

    assert_response 200
    assert_equal 2, JSON.parse(@response.body).size
  end
end
