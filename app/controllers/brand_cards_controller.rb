class BrandCardsController < ApplicationController
  def index
    @brand = Brand.find(params[:id])
    @cards = @brand.cards
  end

end
