class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def new
    @business = Business.new
    @types = Category.all
  end

  def create
    @business = Business.new business_params
    if @business.save
      flash[:success] = "Add a business successfully."
      redirect_to businesses_path
    else
      flash[:warning] = "Something wrong!"
      render "new"
    end
  end

  private

  def business_params
    params.require(:business).permit(:category_id, :name, :description, :address)
  end
end
