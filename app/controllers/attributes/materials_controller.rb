class Attributes::MaterialsController < ApplicationController
  def index
    @materials = Material.all
    render json: @materials
  end
end
