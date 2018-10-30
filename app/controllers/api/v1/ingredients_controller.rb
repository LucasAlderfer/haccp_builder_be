class Api::V1::IngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredient_params)
    if ingredient.save
      render json: { id: ingredient.id }
    else
      render json: { error: "Unable to update ingredient"}, status: 500
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :receiving_from, :receiving_dna, :receiving_other, :receiving_letter, :receiving_hazard_bio, :receiving_hazard_chem, :receiving_hazard_phys, :receiving_hazard_handling, :inventory_type, :inventory_dna, :inventory_other, :inventory_hazard_bio, :inventory_hazard_chem, :inventory_hazard_phys, :inventory_hazard_handling, :packaging_dna, :packaging_other, :packaging_method, :packaging_hazard_bio, :packaging_hazard_chem, :packaging_hazard_phys, :packaging_hazard_handling, :processing_dna, :processing_other, :processing_method, :processing_hazard_bio, :processing_hazard_chem, :processing_hazard_phys, :processing_hazard_handling)
  end

end
