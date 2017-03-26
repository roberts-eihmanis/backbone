class PersonEquipmentsController < ApplicationController
  before_action :set_person_equipment, only: [:show, :edit, :update, :destroy]

  # GET /person_equipments
  # GET /person_equipments.json
  def index
    @person_equipments = PersonEquipment.all
    respond_to do |format|
      format.html
      format.json { render json: @person_equipments }
    end
  end

  # GET /person_equipments/1
  # GET /person_equipments/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @person_equipment }
    end
  end

  # GET /person_equipments/new
  def new
    @person_equipment = PersonEquipment.new
  end

  # GET /person_equipments/1/edit
  def edit
  end

  # POST /person_equipments
  # POST /person_equipments.json
  def create
    binding.pry
    @person_equipment = PersonEquipment.new(person_equipment_params)

    respond_to do |format|
      if @person_equipment.save
        format.html { redirect_to @person_equipment, notice: 'Person Equipment was successfully created.' }
        format.json { redirect_to @person_equipment }
      else
        format.html { render :new }
        format.json { render json: @person_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /person_equipments/1
  # PATCH/PUT /person_equipments/1.json
  def update
    respond_to do |format|
      if @person_equipment.update(person_equipment_params)
        format.html { redirect_to @person_equipment, notice: 'Person Equipment was successfully updated.' }
        format.json { redirect_to @person_equipment, status: 303 }
#        format.json { render json: 'updated', status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @person_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_equipments/1
  # DELETE /person_equipments/1.json
  def destroy
    @person_equipment.destroy
    respond_to do |format|
      format.html { redirect_to person_equipments_url, notice: 'PersonEquipment was successfully destroyed.' }
      format.json { redirect_to person_equipments_url, status: 303  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person_equipment
      @person_equipment = PersonEquipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_equipment_params
      params.require(:person_equipment).permit(:title, :size, :manafacturer, :manafacturer_country,
        :price, :code, :count, :worker_id, :issuer_id, :warranty, :category, :article_number)
    end
end
