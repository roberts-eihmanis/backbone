class Todo.Routers.Tasks extends Backbone.Router
  routes:
    '' : 'index'
    #'tasks/' : 'index'
    #'tasks' : 'index'
    'new' : 'new'
    
  initialize: ->
    @todoTasks = new Todo.Collections.Tasks()
    @todosView = new Todo.Views.TasksIndex(collection: @todoTasks)

  index: ->
    console.log 'Index'

    @todoTasks.fetch
      success: => 
        console.log 'success'
        $('#app').html(@todosView.render().el)
      error: -> 
        console.log 'error'
        $('#app').html('Ups')

  new: ->
    console.log 'New'
    newtask = new Todo.Views.TaskNew()

    newtask.render()
    $('#app').html(newtask.el)

