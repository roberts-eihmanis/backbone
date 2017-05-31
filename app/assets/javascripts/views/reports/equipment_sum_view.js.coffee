class Inventory.Views.ReportsEquipmentSumView extends Backbone.View
  template: JST['reports/equipment']

  events:
    'click .search' : 'search'

  templateAttributes: ->
    @collection.toJSON()

  initialize: ->
    @listenTo @collection, 'reset', @renderData

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderData()
    @$('.datepicker').datepicker(dateFormat: "dd.mm.yy")
    @

  renderData: ->
    @collection.each (model) =>
      dataView = new Inventory.Views.ReportsEquipmentsSumView(model: model)
      @$('.by_period').append(dataView.render().el)
    @

  search: (e) ->
    e.preventDefault()
    $('.by_period').empty()
    dateLte = @$el.find('input[name=date_lte]').val()
    dateGte = @$el.find('input[name=date_gte]').val()
    @collection.search(dateGte, dateLte)
    @collection.fetch({reset:true})
