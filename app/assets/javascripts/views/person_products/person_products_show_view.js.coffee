class Inventory.Views.PersonProductShow extends Backbone.View
  template: JST['person_equipments/show']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @