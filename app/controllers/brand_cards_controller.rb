class BrandCardsController < ApplicationController
  def index
    brand = Brand.find(params[:id])
    @cards = brand.cards
  end

  def new
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.find(params[:id])
    @brand.cards.create(card_params)
    redirect_to "/brands/#{@brand.id}/cards"
  end

  private
  def card_params
    params.permit(:player_name, :description, :graded, :value)
  end

end
