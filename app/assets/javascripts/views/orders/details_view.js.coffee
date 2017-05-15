class Inventory.Views.OrderDetailsView extends Backbone.View
  template: JST['orders/details']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))