class Api::V1::CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Company.all
  end

  def show
    render json: Company.find(params[:id])
  end

  def create
    company = Company.create!(company_params)
    if company.save
      render json: { id: company.id }
    else
      render json: { error: "Unable to create message"}, status: 500
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :email, :password, :phone, :team_member_1_name, :team_member_1_title)
  end
end
