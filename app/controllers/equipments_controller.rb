class EquipmentsController < ApplicationController
# GET /equipments
  def index
    @equipments = PersonEquipment.
      select(:title, :size, :manafacturer, :manafacturer_country, :price, :code, 'SUM(count) AS count').
      where(worker_id: nil).
      group('title', 'size', 'manafacturer', 'manafacturer_country', 'price', 'code', 'count')
    respond_to do |format|
      format.html
      format.json { render json: @equipments }
    end
  end

  def catalogue
    @equipments = PersonEquipment.
      select(:title, :size, :manafacturer, :manafacturer_country, :price, :code, 'SUM(count) AS count').
      where(count: 0).
      group('title', 'size', 'manafacturer', 'manafacturer_country', 'price', 'code', 'count')
    respond_to do |format|
      format.html
      format.json { render json: @equipments }
    end
  end
end
