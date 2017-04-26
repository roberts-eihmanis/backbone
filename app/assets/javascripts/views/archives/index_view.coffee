class Inventory.Views.ArchiveIndexView extends Backbone.View
  template: JST['archives/index']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderPersonEquipments()
    @

  renderPersonEquipments: ->
    @collection.each (model) =>
      archiveEquipmentView = new Inventory.Views.ArchiveEquipmentView(model: model)
      @$('.person_equipments').append(archiveEquipmentView.render().el)

  renderOrders: ->

