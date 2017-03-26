class Inventory.Views.ReportsIndex extends Backbone.View
  template: JST['reports/index']

  templateAttributes: ->


  render: ->
    @$el.html(@template(@templateAttributes()))
    @