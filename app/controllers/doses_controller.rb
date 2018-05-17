class DosesController < ApplicationController
  before_action :dose_find, only: [:destroy]

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail #Changed this
    else
      render :new
    end
  end

  def destroy
    # /cocktails/:cocktail_id/doses/:id(.:format)
    @dose = Dose.find(params[:id])
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
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
