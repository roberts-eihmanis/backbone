class Inventory.Routers.Tasks extends Backbone.Router
  routes:
    'tasks' : 'index'
    'tasks/new' : 'new'
    'tasks/edit/:id' : 'edit'
    'tasks/show' : 'show'
    
  initialize: ->
    @tasks = new Inventory.Collections.Tasks
    @tasksView = new Inventory.Views.TasksIndex(collection: @tasks)
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    console.log 'Index Tasks'
    @$body.empty()

    @tasks.fetch
      success: =>
        console.log 'success'
        @$body.html(@tasksView.render().el)
      error: -> 
        console.log 'error'
        @$body.html('Ups')

  new: ->
    console.log 'New'
    newForm = new Inventory.Views.TaskForm(model: new Inventory.Models.Task())
    newForm.render()
    
    @$body.html(newForm.el)

  edit: (id) ->
    console.log 'Edit'
    @task = new Inventory.Models.Task(id: id)
    @task.fetch
      success: =>
        editForm = new Inventory.Views.TaskForm(model: @task)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        console.log 'error'
        $('.tasks').html('Ups')
