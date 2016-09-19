class Todo.Views.TaskShow extends Backbone.View
  template: JST['tasks/show']
  events: {
    'change input': 'clicked'
    'click .delete': 'delete'
  }

  initialize: ->
    @model.on('change', @render, @)
    #@model.on('destroy', @remove, @)

  templateAttributes: ->
    name: @model.get('name')
    completed: @model.get('completed')
    id: @model.get('id')

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
    html = @template @templateAttributes()
    @$el.html html
    @
