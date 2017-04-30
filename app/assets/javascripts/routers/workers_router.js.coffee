class Inventory.Routers.Workers extends Backbone.Router
  routes:
    'workers' : 'index'
    'workers/new' : 'new'
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
    newForm = new Inventory.Views.WorkerForm(model: new Inventory.Models.Worker())
    newForm.render()
    @$body.html(newForm.el)

  show: (id) ->
    @inventoryWorker = new Inventory.Models.Worker(id: id)
    @inventoryWorker.fetch
      success: =>
        detailsView = new Inventory.Views.Details(model: @inventoryWorker)
        detailsView.render()
        @$body.html(detailsView.el)
      error: =>
        @$body.html('Ups')
