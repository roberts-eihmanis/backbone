class Inventory.Views.ProductsView extends Backbone.View
  template: JST['person_equipments/products']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @