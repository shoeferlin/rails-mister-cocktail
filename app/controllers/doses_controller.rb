class DosesController < ApplicationController
  before_action :dose_find, only: [:destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to new_cocktail_dose_path
    else
      render :new
    end
  end

  def destroy
    @dose = dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_find
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_find
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
