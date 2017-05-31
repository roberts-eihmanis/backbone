class Inventory.Views.ReportsEquipmentsSumView extends Backbone.View
  template: JST['reports/equipment_sum_show']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
