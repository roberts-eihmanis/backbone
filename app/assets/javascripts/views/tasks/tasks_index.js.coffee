class Todo.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  render: ->
    console.log 'rendering_tasksindex'
    @$el.empty()
    @collection.each (task) =>
      taskView = new Todo.Views.TaskShow(model: task)
      @$el.append taskView.render().el
    @



