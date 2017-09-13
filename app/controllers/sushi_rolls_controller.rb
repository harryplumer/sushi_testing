class SushiRollsController < ApplicationController
 before_action :set_rolls, except: [:index, :new, :create]

  def index
    @rolls = current_user.sushi_rolls
  end

  def show
  end

  def new
    render :form
  end

  def create
    @rolls = Sushi_roll.new(sushi_roll_params)
    if @sushi_roll.save
      redirect_to @sushi_roll, notice: 'Sushi created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @rolls.destroy
    redirect_to sushi_roll_url, notice: 'Sushi roll destroyed.'
  end

  private
    def set_rolls
      @rolls = current_user.rolls.find(params[:id])
    end

    def rolls_params
      params.require(:rolls).permit(:name, :price, :spicy)
    end
end
