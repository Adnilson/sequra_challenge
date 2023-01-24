module Repositories
  class OrderRepository
    def self.create_disbursements
      Order.where("completed_at >= ? AND disbursed = ?", 7.days.ago, false).find_each do |order|
        DisbursementRepository.create(order)
        order.update(disbursed: true)
      end
    end
  end
end
