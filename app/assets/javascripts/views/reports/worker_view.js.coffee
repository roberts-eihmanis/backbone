class Inventory.Views.ReportsWorkerView extends Backbone.View
  template: JST['reports/period']

  templateAttributes: ->
    @collection.toJSON()

  initalize: ->
    @listenTo @collection, 'reset', @render

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderData()
    @

  renderData: ->
    @collection.each (model) =>
      dataView = new Inventory.Views.ReportsWorkersView(model: model)
      @$('.by_period').append(dataView.render().el)
    @