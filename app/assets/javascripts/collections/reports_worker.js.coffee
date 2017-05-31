class Inventory.Collections.ReportsWorker extends Backbone.Collection
  url: '/reports/by_worker.json'

  search: (worker, date_gte, date_lte) ->
    @url = "/reports/by_worker.json?worker=#{worker}&date_gte=#{date_gte}&date_lte=#{date_lte}"
    @xhr.abort() if @xhr
    @xhr = @fetch()