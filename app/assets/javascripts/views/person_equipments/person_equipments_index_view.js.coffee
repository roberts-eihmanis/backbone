class Inventory.Views.PersonEquipmentIndex extends Backbone.View
  template: JST['person_equipments/index']

  events:
    'keyup .search' : 'search'

  initialize: ->
    @listenTo @collection[0], 'search', @renderProducts

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

  search: ->
    $('.products').empty()
    input = $('.search').val()
    @collection[0].search(input)
    @collection[0].trigger('search')
