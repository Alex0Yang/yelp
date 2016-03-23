class ReviewsController < ApplicationController
  before_action :authenticate, only: :create
  def index
    @reviews = Review.all
  end

  def create
    @business = Business.find params[:review][:business_id]
    @review = Review.new(review_params.merge({ user_id: current_user.id }) )
    if @review.save
      flash[:info] = "Your review added."
    else
      flash[:danger] = "Invalid input"
    end

    redirect_to @business
  end

  private

  def review_params
    params.require(:review).permit(:business_id, :content, :rate)
  end
end
