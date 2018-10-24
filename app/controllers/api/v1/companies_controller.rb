class Api::V1::CompaniesController < ApplicationController

  def index
    render json: Company.all
  end

  def show
    render json: Company.find(params[:id])
  end

  def create
    company = Company.create!(JSON.parse(params[:company]))
    if company.save
      render json: { id: company.id }
    else
      render json: { error: "Unable to create message"}, status: 500
    end
  end

end
