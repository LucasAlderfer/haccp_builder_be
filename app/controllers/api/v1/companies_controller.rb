class Api::V1::CompaniesController < ApplicationController
  before_action :authenticate_user!, :user_signed_in?

  def index
    render json: Company.all
  end

  def show
    render json: current_user.companies.includes(:ingredients).find(params[:id])
  end

  def create
    company = current_user.companies.create(company_params)
    if company.save
      render json: { id: company.id }
    else
      render json: { error: "Unable to create company"}, status: 500
    end
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    if company.save
      render json: company
    else
      render json: { error: "Unable to update company"}, status: 500
    end
  end

  def auth
    company = Company.find_by_email(params[:company_email])
    if company && company.authenticate(params[:company_password])
      render json: { id: company.id, name: company.name }
    else
      render json: { error: "Login Error"}, status: 404
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address, :phone, :team_member_1_name, :team_member_1_title, :user_id)
  end
end
