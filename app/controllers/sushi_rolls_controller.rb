class SushiRollsController < ApplicationController
 before_action :set_roll, except: [:index, :new, :create]

  def index
    @rolls = current_user.sushi_rolls
  end

  def new
    @roll = current_user.sushi_rolls.new
    render partial: "form"
  end

  def create
    @roll = current_user.sushi_rolls.new(sushi_roll_params)  
    if @roll.save
      redirect_to sushi_rolls_url, notice: 'Sushi created!'
    else
      render partial: "form"
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @roll.update(sushi_roll_params)
      redirect_to sushi_rolls_url, notice: 'Sushi Roll was successfully updated.'
    else
      render partial: "form"
    end
  end

  def destroy
    @roll.destroy
    redirect_to sushi_rolls_url, notice: 'Sushi roll destroyed.'
  end

  private
    def set_roll
      @roll = current_user.sushi_rolls.find(params[:id])
    end

    def sushi_roll_params
      params.require(:sushi_roll).permit(:name, :price, :spicy)
    end
    
end
