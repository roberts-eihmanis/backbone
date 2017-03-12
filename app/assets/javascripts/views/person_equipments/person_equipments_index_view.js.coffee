class Inventory.Views.PersonEquipmentIndex extends Backbone.View
  template: JST['person_equipments/index']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderJournal()
    @renderProducts()
    @

  renderJournal: ->
    journalView = new Inventory.Views.PersonEquipmentShow
    @$('.journal').append(journalView.render().el)

  renderProducts: ->
    productView = new Inventory.Views.ProductsView
    @$('.products').append(productView.render().el)