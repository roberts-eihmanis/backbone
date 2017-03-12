class Inventory.Views.PersonEquipmentShow extends Backbone.View
  template: JST['person_equipments/show']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @