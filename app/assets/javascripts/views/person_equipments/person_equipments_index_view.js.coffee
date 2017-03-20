class Inventory.Views.PersonEquipmentIndex extends Backbone.View
  template: JST['person_equipments/index']

  templateAttributes: ->
    @collection.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderJournal()
    @renderProducts()
    @

  renderJournal: ->
    journalView = new Inventory.Views.PersonEquipmentShow
    @$('.journal').append(journalView.render().el)

  renderProducts: ->
    @collection.each (product) =>
      productView = new Inventory.Views.ProductsView(model: product)
      @$('.products').append(productView.render().el)
    @