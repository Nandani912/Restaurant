class RestaursController < ApplicationController
  before_action :authenticate_user!
  before_action :only_owner, only: [:new,:create,:edit, :update,:destroy]
  def index
    @restaurs=current_user.restaurs
  end

  def new 
    @restaur=Restaur.new 
  end
  def create
   @restaur=current_user.restaurs.build(restaur_params)
   if @restaur.save
    redirect_to restaurs_path
    else
    render :new
   end
   end
   def edit
    @restaur=Restaur.find(params[:id])
   end

  def update
    @restaur=Restaur.find(params[:id])
    if @restaur.update(restaur_params)
      redirect_to restaurs_path, notice: 'Restaur was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaur=Restaur.find(params[:id])
    @restaur.destroy
    redirect_to restaurs_path, notice: 'Restaur was successfully destroyed.'
  end
  private
   def restaur_params
    params.require(:restaur).permit(:name, :address)
  end
  def only_owner
    unless current_user.owner?
     redirect_to restaurs_path, notice: 'You are not the owner , you are not authorized'
    end
  end
end




  