require "test_helper"
require "disbursement_amount"

class DisbursementAmountTest < Minitest::Test
  def test_calculate
    @expected_amount = DisbursementAmount.new(50).calculate

    assert_equal @expected_amount, 49.53
  end
end
