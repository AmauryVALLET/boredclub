class ApesController < ApplicationController
    before_action :set_ape, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]
  
    def index
      @apes = policy_scope(Ape)
    end
  
    def show
      authorize @ape
      @review = Review.new
    end
  
    def new
      @ape = Ape.new
      authorize @ape
    end
  
    def create
      @ape = Ape.new(ape_params)
      @ape.user = current_user
      authorize @ape
  
      if @ape.save
        redirect_to ape_path(@ape), notice: 'ape was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      authorize @ape
    end
  
    def update
      authorize @ape
      if @ape.update(ape_params)
          redirect_to ape_path(@ape), notice: 'Your Ape was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @ape
      @ape.destroy
  
      redirect_to apes_path, notice: 'Your Ape was successfully destroyed.'
    end
  
    private
  
    def set_ape
      @ape = Ape.find(params[:id])
    end
  
    def ape_params
      params.require(:ape).permit(:name, :address)
    end   

end
