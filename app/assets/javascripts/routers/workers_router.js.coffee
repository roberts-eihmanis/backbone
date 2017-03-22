class Inventory.Routers.Workers extends Backbone.Router
  routes:
    'workers' : 'index'
    'workers/new' : 'new'
    'workers/edit/:id' : 'edit'
    'workers/show/:id' : 'show'
    
  initialize: ->
    @inventoryWorkers = new Inventory.Collections.Workers
    @workersView = new Inventory.Views.WorkersIndex(collection: @inventoryWorkers)
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @inventoryWorkers.fetch
      success: =>
        @$body.html(@workersView.render().el)
      error: =>
        @$body.html('Ups')

  new: ->
    console.log 'New'
    newForm = new Inventory.Views.WorkerForm(model: new Inventory.Models.Worker())
    newForm.render()
    @$body.html(newForm.el)

  show: (id) ->
    console.log "show"
    @inventoryWorkers = new Inventory.Models.Worker(id: id)
    @inventoryWorkers.fetch
      success: =>
        detailsView = new Inventory.Views.Details(model: @inventoryWorkers)
        detailsView.render()
        @$body.html(detailsView.el)
      error: =>
        @$body.html('Ups')


  edit: (id) ->
    console.log 'Edit'
    @inventoryWorkers = new Inventory.Models.Worker(id: id)
    @inventoryWorkers.fetch
      success: =>
        editForm = new Inventory.Views.WorkerForm(model: @inventoryWorkers)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        console.log 'error'
        @$body.html('Ups')
