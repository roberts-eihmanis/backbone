class Inventory.Collections.Workers extends Backbone.Collection
  url: '/workers.json'
  model: Inventory.Models.Worker

  search: (params) ->
    @url = "/workers.json?search=#{params}"
    @xhr.abort() if @xhr
    @xhr = @fetch()