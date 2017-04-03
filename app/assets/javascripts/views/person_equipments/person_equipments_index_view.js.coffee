class Inventory.Views.PersonEquipmentIndex extends Backbone.View
  template: JST['person_equipments/index']

  templateAttributes: ->
    @collection[0].toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderJournal()
    @renderProducts()
    @

  renderJournal: ->
    personEquipments = @collection[1].filter (equipment) ->
      equipment.get('issuer_id') != null
    personEquipments.forEach (personEquipment) =>
      journalView = new Inventory.Views.PersonEquipmentShow(model: personEquipment, collection: [@collection[2], @collection[3]])
      @$('.journal').append(journalView.render().el)
    @

  renderProducts: ->
    @collection[0].each (product) =>
      productView = new Inventory.Views.ProductsView(model: product)
      @$('.products').append(productView.render().el)
    @