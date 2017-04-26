class Inventory.Views.OrdersShowView extends Backbone.View
  template: JST['orders/show']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @