class DishesController < ApplicationController
  before_action :only_owner, only: [:new,:create,:edit, :update,:destroy]
  def index
    @dishes=Dish.where(menu_id: params[:menu_id])
  end
  def show
    @dish=Dish.find(params[:id])
  end
  def new
    @dish=Dish.new
  end
  def create
    @dish=Dish.where(menu_id: params[:menu_id]).new(dish_params)
    if @dish.save
      redirect_to restaur_menu_dishes_path
    else
     render :new
    end
  end

  def edit
    @dish=Dish.find(params[:id])
  end
  def update
    @dish=Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to restaur_menu_dishes_path
    else
     render 'edit'
    end
  end
  def destroy
    @dish=Dish.find(params[:id])
    @dish.destroy
    redirect_to restaur_menu_dishes_path
  end
    
  private
  def dish_params
    params.require(:dish).permit(:name , :decription, :price)
  end
  def only_owner
    unless current_user.owner?
     redirect_to restaurs_path, notice: 'You are not the owner , you are not authorized'
    end
  end
end

