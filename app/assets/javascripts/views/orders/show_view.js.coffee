class Inventory.Views.OrdersShowView extends Backbone.View
  template: JST['orders/show']
  tagName: 'tr'
  className: 'details_row'

  events:
    'click td' : 'openWorkers'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  openWorkers: ->
    detailsView = new Inventory.Views.OrderDetailsView()