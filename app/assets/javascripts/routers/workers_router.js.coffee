class Inventory.Routers.Workers extends Backbone.Router
  routes:
    'workers' : 'index'
    'workers/new' : 'new'
    'workers/edit/:id' : 'edit'
    'workers/show' : 'show'
    
  initialize: ->
    @inventoryWorkers = new Inventory.Collections.Workers()
    @workersView = new Inventory.Views.WorkersIndex(collection: @inventoryWorkers)
    @$body = $(document).find('#page-content-wrapper')
    @$body.empty()

  index: ->
    console.log 'WorkersIndex'

    @inventoryWorkers.fetch
      success: =>
        console.log 'success'
        @$body.html(@workersView.render().el)
      error: ->
        console.log 'error'
        @$body.html('Ups')

  new: ->
    console.log 'New'
    newForm = new Inventory.Views.WorkerForm(model: new Inventory.Models.Worker())
    newForm.render()
    @$body.html(newForm.el)

  edit: (id) ->
    console.log 'Edit'
    @todoTask = new Inventory.Models.Worker(id: id)
    @todoTask.fetch
      success: =>
        editForm = new Inventory.Views.TaskForm(model: @todoTask)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        console.log 'error'
        @$body.html('Ups')
