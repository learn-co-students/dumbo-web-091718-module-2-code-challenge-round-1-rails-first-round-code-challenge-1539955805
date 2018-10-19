class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @powers = Power.all

    if @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end

  def search
    # byebug
    if params[:q].downcase === "all" || params[:q].empty?
      redirect_to heroines_path
    elsif !Power.find_by(name: params[:q].downcase).nil?
      @power = Power.find_by(name: params[:q].downcase)
      @heroines = @power.heroines
      render :index
    else
      render :empty
    end
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :power_id, :super_name)
  end
end
