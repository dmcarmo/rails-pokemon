class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    return unless params[:search]

    @pokemons = @pokemons.where("name ILIKE ?", "%#{params[:search]}%")
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokeball = Pokeball.new
  end
end
