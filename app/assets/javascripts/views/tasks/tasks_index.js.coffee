class Todo.Views.TasksIndex extends Backbone.View

  initialize: ->
    console.log "initialize"
    # @listenTo(@collection, 'sync', @render)

  render: ->
    console.log 'rendering_tasksindex'
    @collection.each (task) =>
      taskView = new Todo.Views.TaskShow(model: task)
      @$el.append taskView.render().el
    @



