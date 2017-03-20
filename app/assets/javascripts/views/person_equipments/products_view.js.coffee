class Inventory.Views.ProductsView extends Backbone.View
  template: JST['person_equipments/products']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @