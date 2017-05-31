class ReportsController < ApplicationController
  def by_period
    @equipments_by_period = PersonEquipment.report_search(params[:date_lte], params[:date_gte])
      .select(:title, :purchased_at, 'SUM(count) as count')
      .where.not(worker_id: nil)
      .group('title', 'purchased_at')
    @grouped_eq = @equipments_by_period.group('title')
    respond_to do |format|
      format.html
      format.json { render json: @grouped_eq }
    end
  end

  def by_sum
    @equipments_by_sum = PersonEquipment.report_search(params[:date_lte], params[:date_gte])
      .select(:title, :purchased_at, 'SUM(price) as price')
      .where.not(worker_id: nil)
      .group('title', 'purchased_at')
    @grouped_eq_by_sum = @equipments_by_sum.group('title')
    respond_to do |format|
      format.html
      format.json { render json: @grouped_eq_by_sum }
    end
  end

  def by_worker
    @equipments_by_worker = PersonEquipment
      .joins('LEFT JOIN workers ON person_equipments.worker_id = workers.id')
      .select('workers.id', 'person_equipments.title', 'workers.first_name', 'workers.last_name', 'SUM(person_equipments.price) as price', 'SUM(person_equipments.count) as count')
      .where.not(worker_id: nil)
      .group('workers.id', 'workers.first_name', 'workers.last_name', 'person_equipments.title')

    if params[:worker]
      @equipments_by_worker = @equipments_by_worker.where(worker_id: params[:worker])
    end
    respond_to do |format|
      format.html
      format.json { render json: @equipments_by_worker }
    end
  end
end