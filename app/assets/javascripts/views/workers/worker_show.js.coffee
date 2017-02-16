class Inventory.Views.WorkerShow extends Backbone.View
  template: JST['workers/show']

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
