class Inventory.Views.PersonProductsArchive extends Backbone.View
  template: JST['person_equipments/archive']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @