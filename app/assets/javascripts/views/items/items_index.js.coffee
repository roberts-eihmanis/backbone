class Todo.Views.ItemsIndex extends Backbone.View
  $el = '#task_list'

  render: ->
    @collection.each ((tasks) ->
      taskView = new Todo.Views.TasksIndex(model: Todo.Models.Task)
      @$el.append taskView.render().el
      console.log "render"
      console.log tasks
      return
    ),this
  this
    # this.$el.html()


  #task_col = new Todo.Collections.Tasks([@t1, @t2, @t3])

  console.log "View_Items"


  #view.render()
