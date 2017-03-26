class Inventory.Routers.Reports extends Backbone.Router
  routes:
    'reports' : 'index'
    
  initialize: ->
    @reportsView = new Inventory.Views.ReportsIndex
    @$body = $(document).find('#page-content-wrapper')

  index: ->
    @$body.html(@reportsView.render().el)