class Inventory.Views.ArchiveOrdersView extends Backbone.View
  template: JST['archives/orders']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
