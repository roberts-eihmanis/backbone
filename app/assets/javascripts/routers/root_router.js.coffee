class Inventory.Routers.Root extends Backbone.Router
  '#' : 'index'

  initialize: ->
    @welcomeView = new Inventory.Views.WelcomeView
    @$body = $(document).find('#page-content-wrapper')
    @$body.append(@welcomeView.render())
