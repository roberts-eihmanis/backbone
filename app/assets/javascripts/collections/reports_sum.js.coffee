class Inventory.Collections.ReportsSum extends Backbone.Collection
  url: '/reports/by_sum.json'

  search: (date_gte, date_lte) ->
    @url = "/reports/by_sum.json?date_gte=#{date_gte}&date_lte=#{date_lte}"
    @xhr.abort() if @xhr
    @xhr = @fetch()