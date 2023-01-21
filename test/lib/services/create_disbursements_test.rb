require "test_helper"
require "services/create_disbursements"

module Services
  class CreateDisbursementsTest < Minitest::Test
    def setup
      merchant = Merchant.create(name: "James")
      shopper = Shopper.create(name: "Paulo")

      Order.create(amount: 10.00, completed_at: 7.days.ago, merchant_id: merchant.id, shopper_id: shopper.id)
      Order.create(amount: 10.00, completed_at: 7.days.ago + 1.second, merchant_id: merchant.id, shopper_id: shopper.id)
      Order.create(amount: 10.00, completed_at: DateTime.now, merchant_id: merchant.id, shopper_id: shopper.id)
      Order.create(amount: 10.00, merchant_id: merchant.id, shopper_id: shopper.id)
    end

    def teardown
      Disbursement.destroy_all
      Order.destroy_all
    end

    def test_call
      Services::CreateDisbursements.call

      assert_equal 2, Disbursement.count
      assert_equal 9.90, Disbursement.last.amount
    end
  end
end
