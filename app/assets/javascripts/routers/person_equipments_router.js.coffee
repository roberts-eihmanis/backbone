class Inventory.Routers.PersonEquipments extends Backbone.Router
  routes:
    'person_equipments' : 'index'
    'person_equipments/new' : 'new'
    'person_equipments/edit/:id' : 'edit'
    'person_equipments/show/:id' : 'show'
    'person_equipments/issue' : 'issue'
    'person_equipments/order' : 'order'
    
  initialize: ->
    @personEquipments = new Inventory.Collections.PersonEquipments
    @productsView = new Inventory.Views.PersonEquipmentIndex(collection: @personEquipments)
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @$body.html(@productsView.render().el)

  new: ->
    model = new Inventory.Models.PersonEquipment
    newForm = new Inventory.Views.PersonEquipmentForm(model: model)
    newForm.render()
    
    @$body.html(newForm.el)

  edit: (id) ->
    @personEquipment = new Inventory.Models.PersonEquipment(id: id)
    @personEquipment.fetch
      success: =>
        editForm = new Inventory.Views.PersonEquipmentForm(model: @personEquipment)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        console.log 'error'
        $('.tasks').html('Ups')

  issue: ->
    issueView = new Inventory.Views.PersonEquipmentIssue
    @$body.html(issueView.render().el)