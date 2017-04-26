class EquipmentOrdersController < ApplicationController
  before_action :set_equipment_order, only: [:destroy, :update]
  # GET /equipment_orders
  # GET /equipment_orders.json
  def index
    @equipment_orders = EquipmentOrder.all
    respond_to do |format|
      format.json { render json: @equipment_orders }
    end
  end

  # GET /equipment_orders/new
  def new
    @equipment_order = EquipmentOrder.new
  end

  # GET /equipment_orders/1/edit
  def edit
  end

  # POST /equipment_orders
  # POST /equipment_orders.json
  def create
    @equipment_order = EquipmentOrder.new(equipment_order_params)
    @equipment_order.save
    respond_to do |format|
      format.html { redirect_to equipment_orders_path, status: 303 }
      format.json { redirect_to equipment_orders_path, status: 303 }
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @equipment_order.update(equipment_order_params)
        format.html { redirect_to equipment_orders_path, notice: 'Worker was successfully updated.' }
        format.json { redirect_to equipment_orders_path, status: 303 }
#        format.json { render json: 'updated', status: :ok }
      else
        format.json { render json: @equipment_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_orders/1
  # DELETE /equipment_orders/1.json
  def destroy
    @equipment_order.destroy
    respond_to do |format|
      format.html { redirect_to equipment_orders_url, notice: 'PersonEquipment was successfully destroyed.' }
      format.json { redirect_to equipment_orders_url, status: 303  }
    end
  end

  private

  def set_equipment_order
    @equipment_order = EquipmentOrder.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def equipment_order_params
    params.require(:equipment_order).permit(:worker_id, :person_equipment_id, :order_id, :count)
  end
end