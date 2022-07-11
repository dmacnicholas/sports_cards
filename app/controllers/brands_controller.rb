class BrandsController < ApplicationController
  def index
    @brands = Brand.all.sort_by_new
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
  end

  def create
    Brand.create(brand_params)
    redirect_to '/brands'
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    brand = Brand.find(params[:id])
    brand.update(brand_params)
    brand.save
    redirect_to "/brands/#{brand.id}"
  end

  private
  def brand_params
   params.permit(:name, :year, :sold_at_retail)
  end
end
