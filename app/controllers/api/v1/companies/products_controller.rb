class Api::V1::Companies::ProductsController < ApplicationController
  before_action :authenticate_user!, :user_signed_in?

  def create
    company = Company.find(params[:id])
    product = company.products.create(product_params)
    if product.save
      render json: { id: product.id }
    else
      render json: { error: "Unable to create product"}, status: 500
    end
  end

  def update
    company = Company.find(params[:id])
    product = company.products.find(params[:product_id])
    product.update(product_params)
    if product.save
      render json: { id: product.id, name: product.name }
    else
      render json: { error: "Unable to update product"}, status: 500
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
