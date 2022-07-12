class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    card = Card.find(params[:id])
    card.update(card_params)
    card.save
    redirect_to "/cards/#{card.id}"
  end

    private
    def card_params
    params.permit(:player_name, :description, :graded, :value)
  end
end
