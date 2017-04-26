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
    @equipmentCatalogue = new Inventory.Collections.EquipmentsCatalogue
    @personEquipments = new Inventory.Collections.PersonEquipments
    @users = new Inventory.Collections.Users
    @workers = new Inventory.Collections.Workers
    @productsView = new Inventory.Views.PersonEquipmentIndex(
      collection: [@equipments, @personEquipments, @users, @workers])
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @equipments.fetch
      success: =>
        @personEquipments.fetch
          success: =>
            @users.fetch
              success: =>
                @workers.fetch
                  success: =>
                    @$body.html(@productsView.render().el)
      error: =>
        @$body.html('Ups')

  new: ->
    model = new Inventory.Models.PersonEquipment
    newForm = new Inventory.Views.PersonEquipmentForm(model: model)
    @$body.html(newForm.el)
    newForm.render()

  edit: (id) ->
    personEquipment = new Inventory.Models.PersonEquipment(id: id)
    personEquipment.fetch
      success: =>
        editForm = new Inventory.Views.PersonEquipmentForm(model: personEquipment)
        editForm.render()
        @$body.html(editForm.el)
      error: ->
        $('.tasks').html('Ups')

  issue: ->
    users = new Inventory.Collections.Users
    inventoryWorkers = new Inventory.Collections.Workers
    issueEquipment = new Inventory.Collections.PersonEquipments
    inventoryWorkers.fetch
      success: =>
        users.fetch
          success: =>
            issueEquipment.fetch
              success: =>
                issueView = new Inventory.Views.PersonEquipmentIssue(
                  collection: [inventoryWorkers, users, issueEquipment])
                @$body.html(issueView.render().el)
      error: =>
        @$body.html('Ups')

  order: ->
    inventoryWorkers = new Inventory.Collections.Workers
    equipmentOrders = new Inventory.Collections.EquipmentOrders
    orderEquipment = new Inventory.Collections.PersonEquipments
    inventoryWorkers.fetch
      success: =>
        orderEquipment.fetch
          success: =>
            equipmentOrders.fetch
              success: =>
                orderView = new Inventory.Views.PersonEquipmentsOrder(
                  model: new Inventory.Models.Order(), 
                  collection: [inventoryWorkers, orderEquipment, equipmentOrders])
                @$body.html(orderView.render().el)

  archive: ->
    @equipmentCatalogue.fetch
      success: =>
        archiveView = new Inventory.Views.ArchiveIndexView(collection: @equipmentCatalogue)
        @$body.html(archiveView.render().el)
      
