class Inventory.Views.ArchiveIndexView extends Backbone.View
  template: JST['archives/index']

  events:
    'keyup .search' : 'search'

  initialize: ->
    @listenTo @collection[0], 'search', @renderPersonEquipments

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderPersonEquipments()
    @renderOrders()
    @$('.datepicker').datepicker(dateFormat: "dd.mm.yy")
    @

  renderPersonEquipments: ->
    @collection[0].each (model) =>
      archiveEquipmentView = new Inventory.Views.ArchiveEquipmentView(model: model)
      @$('.person_equipments').append(archiveEquipmentView.render().el)

  renderOrders: ->
    @collection[1].each (model) =>
      ordersView = new Inventory.Views.ArchiveOrdersView(model: model)
      @$('.orders').append(ordersView.render().el)

  search: ->
    $('.person_equipments').empty()
    input = $('.search').val()
    @collection[0].search(input)
    @collection[0].trigger('search')
