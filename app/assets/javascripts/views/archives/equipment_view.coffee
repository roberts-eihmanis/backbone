class Inventory.Views.ArchiveEquipmentView extends Backbone.View
  template: JST['archives/equipment']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
