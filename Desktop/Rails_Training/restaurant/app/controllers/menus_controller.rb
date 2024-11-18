class MenusController < ApplicationController
  before_action :only_owner, only: [:new,:create,:edit, :update,:destroy]
  def index
    @menus = Menu.where(restaur_id: params[:restaur_id])
  end
  def new 
    @menu = Menu.new
  end
  def create
    @menu = Menu.where(restaur_id: params[:restaur_id]).new(menu_params)
    if @menu.save
      redirect_to restaur_menus_path
    else
     render 'new'
    end
  end
  def edit
    @menu = Menu.find(params[:id])
  end
  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to restaur_menus_path
    else
      render "edit"
    end 
  end
  def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      redirect_to restaur_menus_path
  end
  private
  def menu_params
    params.require(:menu).permit(:title)
  end
  def only_owner
    unless current_user.owner?
     redirect_to restaurs_path, notice: 'You are not the owner , you are not authorized'
    end
  end
end      
  

