class EquipmentOrdersController < ApplicationController
  before_action :set_person_equipment, only: [:destroy]
  # GET /person_equipments
  # GET /person_equipments.json
  def index
    @equipment_orders = EquipmentOrder.all
    respond_to do |format|
      format.html
      format.json { render json: @equipment_orders }
    end
  end

  # GET /person_equipments/new
  def new
    @equipment_order = EquipmentOrder.new
  end

  # GET /person_equipments/1/edit
  def edit
  end

  # POST /person_equipments
  # POST /person_equipments.json
  def create
    @equipment_order = EquipmentOrder.new(equipment_order_params)
    @equipment_order.save
    respond_to do |format|
      format.html { redirect_to equipment_orders_path, status: 303 }
      format.json { redirect_to equipment_orders_path, status: 303 }
    end
  end

  # DELETE /person_equipments/1
  # DELETE /person_equipments/1.json
  def destroy
    @equipment_order.destroy
    respond_to do |format|
      format.html { redirect_to person_equipments_url, notice: 'PersonEquipment was successfully destroyed.' }
      format.json { redirect_to person_equipments_url, status: 303  }
    end
  end

  private

    def set_person_equipment
      @equipment_order = EquipmentOrder.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_order_params
      params.require(:equipment_order).permit(:worker_id, :person_equipment_id, :order_id, :count)
    end


end