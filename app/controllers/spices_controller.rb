class SpicesController < ApplicationController
  def index
    spices = Spice.all
    render json: spices
  end

  def show
    spice = Spice.find(params[:id])
    if spice
        render json: spice, status: :accepted
        else
        render json: { error: "Spice not found" }, status: 404
        end
end

  def create
    spice = Spice.create(spice_params)
    render json: spice
  end

  def update
    spice = Spice.find(params[:id])
    if spice
        spice.update(spice_params)
        render json: spice, status: :accepted
        else
        render json: {error: "Spice not found"}, status: :not_found
        
    end
    
  end

  def destroy
    spice = Spice.find(params[:id])
    spice.destroy
    render json: spice
  end

  private

  def spice_params
    params.permit(:name, :image, :description)
  end
end