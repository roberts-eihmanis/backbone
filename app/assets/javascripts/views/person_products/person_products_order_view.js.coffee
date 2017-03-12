class Inventory.Views.PersonProductsOrder extends Backbone.View
  template: JST['person_equipments/order']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @