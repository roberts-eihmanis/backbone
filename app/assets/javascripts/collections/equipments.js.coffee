class Inventory.Collections.Equipments extends Backbone.Collection
  url: '/equipments.json'
  model: Inventory.Models.Equipment

  search: (params) ->
    @url = "/equipments.json?search=#{params}"
    @xhr.abort() if @xhr
    @xhr = @fetch()