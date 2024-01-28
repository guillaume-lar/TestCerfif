class FlatsController < ApplicationController

 def new
    @flat = Flat.new
 end

 def index
    @pages = Flat.all
 end

 def show
   @user = current_user
   @flat = Flat.find(params[:id])
 end

 def create
  if current_user
   @flat = Flat.new(flat_params)
   @flat.user = current_user
   if @flat.save
     redirect_to flat_path(@flat)
   else
     render :new, status: :unprocessable_entity
   end
  end
 end

 def edit
   @flat = Flat.find(params[:id])
 end

 def update
   @flat = Flat.find(params[:id])
  if @flat.update(flat_params)
    redirect_to @flat, notice: 'Flat was successfully updated.'
  else
    render :edit
  end
 end

 def destroy
   @flat = Flat.find(params[:id])
   @flat.destroy
   redirect_to flats_path
 end

 private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price, :room, :category, :country, :city)
  end
end
