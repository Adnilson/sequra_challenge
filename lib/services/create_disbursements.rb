module Services
  class CreateDisbursements
    def self.call = new.call

    def call
      Repositories::OrderRepository.create_disbursements
    end
  end
end
