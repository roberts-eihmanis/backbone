class Inventory.Views.TaskShow extends Backbone.View
  template: JST['tasks/show']

  events: 
    'change input': 'clicked'
    'click .delete': 'delete'

  initialize: ->
    @model.on('change', @render, @)

  templateAttributes: ->
    @model.toJSON()

  clicked: (e) ->
    newStatus = @$el.find('input[name=completed]').prop('checked')
    @model.save(completed: newStatus)
    @

  delete: ->
    @model.destroy
      success: =>
        alert "destroyed"
        @$el.remove()
      error: ->
        console.log 'nok '
    @

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
