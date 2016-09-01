class Todo.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  @$el : '#task_list'

  templateAttributes: ->
    name: 'test'

  render: ->
    html = @template @templateAttributes()
    console.log @collection
    @$el.html html
    @
    # this.$el.html()



  #view = new Todo.Views.TasksIndex({collection: tasks_collection})
  #view.render()
