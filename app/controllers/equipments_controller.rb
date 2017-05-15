class EquipmentsController < ApplicationController
# GET /equipments
  def index
    @equipments = PersonEquipment.search(params[:search]).
      select(:title, :size, :manafacturer, :category, :manafacturer_country, :price, :code, 'SUM(count) AS count').
      where(worker_id: nil).
      group('title', 'size', 'manafacturer', 'category', 'manafacturer_country', 'price', 'code', 'count')
    respond_to do |format|
      format.html
      format.json { render json: @equipments }
    end
  end

  def catalogue
    @catalogue_equipments = PersonEquipment.search(params[:search]).
      select(:title, :size, :category, :manafacturer, :price).
      where.not(worker_id: nil).
      group('title', 'size', 'category', 'manafacturer', 'price')
    respond_to do |format|
      format.html
      format.json { render json: @catalogue_equipments }
    end
  end
end
