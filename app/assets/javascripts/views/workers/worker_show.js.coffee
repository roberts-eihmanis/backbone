class Inventory.Views.WorkerShow extends Backbone.View
  template: JST['workers/show']
  tagName: 'tr'
  className: 'row_worker'

  events:
    'click td' : 'open'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  open: ->
    Backbone.history.navigate("#workers/show/#{@model.id}", trigger: true)