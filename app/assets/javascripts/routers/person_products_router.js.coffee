class Inventory.Routers.PersonProducts extends Backbone.Router
  routes:
    'person_products' : 'index'
    'person_products/new' : 'new'
    'person_products/edit/:id' : 'edit'
    'person_products/show/:id' : 'show'
    'person_products/issue' : 'issue'
    'person_products/order' : 'order'
    
  initialize: ->
    @tasks = new Inventory.Collections.Tasks
    @productsView = new Inventory.Views.PersonProductIndex(collection: @tasks)
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    console.log 'Index Products'
    # @$body.empty()
    @$body.html(@productsView.render().el)

  new: ->
    console.log 'New'
    newForm = new Inventory.Views.PersonProductForm(model: new Inventory.Models.Task())
    newForm.render()
    
    @$body.html(newForm.el)

  edit: (id) ->
    console.log 'Edit'
    @task = new Inventory.Models.Task(id: id)
    @task.fetch
      success: =>
        editForm = new Inventory.Views.PersonProductForm(model: @tasks)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        console.log 'error'
        $('.tasks').html('Ups')

  issue: ->
    issueView = new Inventory.Views.Issue
    @$body.html(issueView.render().el)