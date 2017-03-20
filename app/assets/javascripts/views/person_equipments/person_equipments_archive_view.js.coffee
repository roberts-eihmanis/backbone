class Inventory.Views.PersonEquipmentsArchive extends Backbone.View
  template: JST['person_equipments/archive']

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
