class BrandsController < ApplicationController
  def index
    @brands = Brand.sort_by_new
  end
  def show
    @brand = Brand.find(params[:id])
  end
end
