class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurants_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :comment)
  end

end
