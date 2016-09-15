class Todo.Views.TaskShow extends Backbone.View
  template: JST['tasks/show']
  events: {
    'change input': 'clicked'
  }

  initialize: ->
    @model.on('change', @render, @)

  templateAttributes: ->
    name: @model.get('name')
    completed: @model.get('completed')
    id: @model.get('id')

  clicked: (e) ->
    newStatus = @$el.find('input[name=completed]').prop('checked')
    @model.save(completed: newStatus)
    @

  render: ->
    html = @template @templateAttributes()
    @$el.html html
    @
