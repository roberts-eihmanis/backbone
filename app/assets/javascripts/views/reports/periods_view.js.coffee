class Inventory.Views.ReportsPeriodsView extends Backbone.View
  template: JST['reports/period_show']
  tagName: 'tr'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @
