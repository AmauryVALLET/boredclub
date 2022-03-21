class ReviewsController < ApplicationController
    def create
        @ape = Ape.find(params[:ape_id])
        @review = Review.new(review_params)
        @review.ape = @ape
        if @review.save
            redirect_to ape_path(@ape)
        else
            render 'apes/show'
        end
    end



    private

    def review_params
        params.require(:review).permit(:content)
    end
end
