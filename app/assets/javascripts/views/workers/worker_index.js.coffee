class Inventory.Views.WorkersIndex extends Backbone.View
  template: JST['workers/index']
  className: 'content_container'

  events:
    'keyup .search' : 'search'

  initialize: ->
    @listenTo @collection, 'search', @renderWorkers

  templateAttributes: ->
    @collection.toJSON()

  render: ->
    @delegateEvents(@events)
    @$el.html(@template(@templateAttributes()))
    @renderWorkers()
    @

  renderWorkers: ->
    @collection.each (worker) =>
      workerView = new Inventory.Views.WorkerShow(model: worker)
      @$('tbody.workers').append workerView.render().el

  search: ->
    $('.workers').empty()
    input = $('.search').val()
    @collection.search(input)
    @collection.trigger('search')
