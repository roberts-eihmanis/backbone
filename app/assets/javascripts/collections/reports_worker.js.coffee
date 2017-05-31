class Inventory.Collections.ReportsWorker extends Backbone.Collection
  url: '/reports/by_sum.json'

  search: (params) ->
    @url = "/reports/by_sum.json?search=#{params}"
    @xhr.abort() if @xhr
    @xhr = @fetch()