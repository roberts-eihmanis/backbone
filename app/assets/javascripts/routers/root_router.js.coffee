class Inventory.Routers.Root extends Backbone.Router
  routes:
    'home' : 'index'

  initialize: ->
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @welcomeView = new Inventory.Views.WelcomeView
    @$body.html(@welcomeView.render().el)
