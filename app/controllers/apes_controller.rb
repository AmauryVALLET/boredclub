class ApesController < ApplicationController
    def index
        @apes = Ape.all
    end


    def show
        @ape = Ape.find(params[:id])
        @review = Review.new
    end
end
