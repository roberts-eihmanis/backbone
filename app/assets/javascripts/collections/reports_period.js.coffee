class Inventory.Collections.ReportsPeriod extends Backbone.Collection
  url: '/reports/by_period.json'

  search: (date_gte, date_lte) ->
    @url = "/reports/by_period.json?date_gte=#{date_gte}&date_lte=#{date_lte}"
    @xhr.abort() if @xhr
    @xhr = @fetch()