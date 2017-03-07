class Inventory.Views.PersonProductForm extends Backbone.View
  template: JST['person_equipments/form']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @