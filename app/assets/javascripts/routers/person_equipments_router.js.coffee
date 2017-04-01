class Inventory.Routers.PersonEquipments extends Backbone.Router
  routes:
    'person_equipments' : 'index'
    'person_equipments/new' : 'new'
    'person_equipments/edit/:id' : 'edit'
    'person_equipments/issue' : 'issue'
    'person_equipments/order' : 'order'
    'person_equipments/archive' : 'archive'
    
  initialize: ->
    @equipments = new Inventory.Collections.Equipments
    @productsView = new Inventory.Views.PersonEquipmentIndex(collection: @equipments)
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @equipments.fetch
      success: =>
        @$body.html(@productsView.render().el)
      error: =>
        @$body.html('Ups')

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
        $('.tasks').html('Ups')

  issue: ->
    users = new Inventory.Collections.Users
    inventoryWorkers = new Inventory.Collections.Workers
    issueModel = new Inventory.Models.PersonEquipment
    inventoryWorkers.fetch
      success: =>
        users.fetch
          success: =>
            issueView = new Inventory.Views.PersonEquipmentIssue(collection: [inventoryWorkers, users], model: issueModel)
            @$body.html(issueView.render().el)
      error: =>
        @$body.html('Ups')

  order: ->
    orderView = new Inventory.Views.PersonEquipmentsOrder
    @$body.html(orderView.render().el)

  archive: ->
    archiveView = new Inventory.Views.PersonEquipmentsArchive
    @$body.html(archiveView.render().el)
