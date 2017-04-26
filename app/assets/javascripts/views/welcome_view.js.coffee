class Inventory.Views.WelcomeView extends Backbone.View
  template: JST['welcome/index']

  initialize: ->
    @listenTo @collection[1], 'reset', @renderEndingEquipments

  render: ->
    @$el.html(@template())
    @renderActiveOrders()
    @renderEndingEquipments()
    @

  renderActiveOrders: ->
    activeOrders = new Inventory.Collections.Orders(@collection[0].where(status: 'ordered'))
    activeOrders.each (order) =>
      ordersView = new Inventory.Views.OrdersShowView(model: order)
      @$('.orders_container').append(ordersView.render().el)

  renderEndingEquipments: ->
    endingEquipments = new Inventory.Collections.PersonEquipments(
      @collection[1].filter (equipment) ->
        equipment.get('count') <= 2
      )
    endingEquipments.each (equipment) =>
      equipmentsView = new Inventory.Views.ProductsView(model: equipment)
      @$('.products').append(equipmentsView.render().el)
