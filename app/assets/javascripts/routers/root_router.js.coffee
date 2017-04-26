class Inventory.Routers.Root extends Backbone.Router
  routes:
    'home' : 'index'

  initialize: ->
    @orders = new Inventory.Collections.Orders
    @equipments = new Inventory.Collections.Equipments
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @equipments.fetch
      success: =>
        @orders.fetch
          success: =>
            @welcomeView = new Inventory.Views.WelcomeView(collection: [@orders, @equipments])
            @$body.html(@welcomeView.render().el)
      error: =>
        @$body.html("UPS")
