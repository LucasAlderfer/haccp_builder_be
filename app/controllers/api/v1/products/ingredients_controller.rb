class Api::V1::Products::IngredientsController < ApplicationController
  before_action :authenticate_company!, :company_signed_in?

  def create
    product = Product.find(params[:id])
    ingredient = product.ingredients.create(ingredient_params)
    if ingredient.save
      render json: { id: ingredient.id }
    else
      render json: { error: "Unable to create ingredient"}, status: 500
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :receiving_from, :receiving_dna, :receiving_other, :receiving_letter, :receiving_hazard_bio, :receiving_hazard_chem, :receiving_hazard_phys, :receiving_hazard_handling, :storage_type, :storage_dna, :storage_other, :storage_hazard_bio, :storage_hazard_chem, :storage_hazard_phys, :storage_hazard_handling, :packaging_dna, :packaging_other, :packaging_method, :packaging_hazard_bio, :packaging_hazard_chem, :packaging_hazard_phys, :packaging_hazard_handling, :preparation_dna, :preparation_other, :preparation_method, :preparation_hazard_bio, :preparation_hazard_chem, :preparation_hazard_phys, :preparation_hazard_handling)
  end

end
