class Todo.Routers.Tasks extends Backbone.Router
  routes:
    '' : 'index'
    #'tasks/' : 'index'
    'tasks' : 'index'
    'new' : 'new'
    'edit/:id' : 'edit'
    'show' : 'show'
    
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
    newForm = new Todo.Views.TaskForm(model: new Todo.Models.Task())
    newForm.render()
    
    $('#app').html(newForm.el)

  edit: (id) ->
    console.log 'Edit'
    @todoTask = new Todo.Models.Task(id: id)
    @todoTask.fetch
      success: =>
        editForm = new Todo.Views.TaskForm(model: @todoTask)
        editForm.render()
        $('#app').html(editForm.el)      
       error: -> 
        console.log 'error'
        $('#app').html('Ups')
    



