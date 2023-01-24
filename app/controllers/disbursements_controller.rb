class DisbursementsController < ApplicationController
  def index
    render json: Repositories::DisbursementRepository.all
  end
end
