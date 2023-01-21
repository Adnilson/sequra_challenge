class DisbursementsController < ApplicationController
  def index
    render json: Disbursement.all
  end
end
