class Inventory.Views.WorkerShow extends Backbone.View
  template: JST['workers/show']
  tagName: 'tr'

  events:
    'click .delete_worker' : 'delete'

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
