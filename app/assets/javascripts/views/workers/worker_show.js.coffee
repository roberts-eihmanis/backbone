class Inventory.Views.WorkerShow extends Backbone.View
  template: JST['workers/show']
  tagName: 'tr'
  className: 'row_worker'

  events:
    'click .delete_worker' : 'delete'
    'click row_worker'     : 'open'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  delete: =>
    @model.unset("errors", {silent: true})
    @model.destroy(
      success: =>
        @$el.empty()
      error: ->
        console.log 'nok '
    )
    false

  open: ->
    Backbone.history.navigate("#workers/show/#{@model.id}", trigger: true)