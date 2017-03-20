class Inventory.Views.PersonEquipmentShow extends Backbone.View
  template: JST['person_equipments/show']
  tagName: 'tr'

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @