class Todo.Views.TaskShow extends Backbone.View
  template: JST['tasks/show']

  templateAttributes: ->
    name: @model.get('name')
    completed: @model.get('completed')

  render: ->
    html = @template @templateAttributes()
    @$el.html html
    @
