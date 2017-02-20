class Inventory.Views.Details extends Backbone.View
  template: JST['workers/details']

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
