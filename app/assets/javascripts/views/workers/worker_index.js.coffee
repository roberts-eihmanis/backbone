class Inventory.Views.WorkersIndex extends Backbone.View
  template: JST['workers/index']
  otherTemplate: JST['workers/prev_index']
  className: 'content_container'

  events:
    'keyup .search'          : 'search'
    'click .ex_workers'      : 'exWorkers'
    'click .cur_workers'     : 'showWorkers'

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
    currentWorkers = @collection.where(active: true)
    currentWorkers.forEach (worker) =>
      workerView = new Inventory.Views.WorkerShow(model: worker)
      @$('tbody.workers').append workerView.render().el

  search: ->
    $('.workers').empty()
    input = $('.search').val()
    @collection.search(input)
    @collection.trigger('search')

  exWorkers: ->
    $('.current_workers').hide()
    @$el.append(@otherTemplate())
    exWorkers = @collection.where(active: false)
    exWorkers.forEach (worker) ->
      exWorkerView = new Inventory.Views.ExWorkerShow(model: worker)
      $('.ex_workers_container').append(exWorkerView.render().el)

  showWorkers: ->
    $('.ex_container').hide()
    $('.current_workers').show()
