module Jobs
  class CreateDisbursementsJob
    include Sidekiq::Job

    def perform
      Services::CreateDisbursements.call
    end
  end
end
