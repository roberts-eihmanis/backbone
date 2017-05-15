class Inventory.Collections.EquipmentsCatalogue extends Backbone.Collection
  url: '/equipments/catalogue.json'
  model: Inventory.Models.EquipmentCatalogue

  search: (params) ->
    @url = "/equipments/catalogue.json?search=#{params}"
    @xhr.abort() if @xhr
    @xhr = @fetch()