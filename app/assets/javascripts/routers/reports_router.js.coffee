class Inventory.Routers.Reports extends Backbone.Router
  routes:
    'reports' : 'index'
    'reports/by_period' : 'byPeriod'
    'reports/by_sum' : 'bySum'
    'reports/by_worker' : 'byWorker'
    
  initialize: ->
    @reportsView = new Inventory.Views.ReportsIndex
    @$body = $(document).find('#page-content-wrapper')
    @byPeriodCollection = new Inventory.Collections.ReportsPeriod
    @bySumCollection = new Inventory.Collections.ReportsSum
    @byWorkerCollection = new Inventory.Collections.ReportsWorker
    @workers = new Inventory.Collections.Workers
    @sumView = new Inventory.Views.ReportsEquipmentSumView(collection: @bySumCollection)
    @periodView = new Inventory.Views.ReportsPeriodView(collection: @byPeriodCollection)
    @workerView = new Inventory.Views.ReportsWorkerView(collection: [@workers, @byWorkerCollection])
    @$body.html(@reportsView.render().el)

  index: ->
    @$body.html(@reportsView.render().el)

  byPeriod: ->
    @byPeriodCollection.fetch
      success: =>
        $('.reports_details_container').html(@periodView.render().el)

  bySum: ->
    @bySumCollection.fetch
      success: =>
        $('.reports_details_container').html(@sumView.render().el)

  byWorker: ->
    @byWorkerCollection.fetch
      success: =>
        @workers.fetch
          success: =>
            $('.reports_details_container').html(@workerView.render().el)