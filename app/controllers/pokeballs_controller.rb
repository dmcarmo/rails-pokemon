class PokeballsController < ApplicationController
  def new
    @pokeball = Pokeball.new
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])

    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    if @pokeball.save
      redirect_to trainer_path(@pokeball.trainer), notice: "You caught a Pokemon!"
    else
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:location, :caught_on, :trainer_id)
  end
end
