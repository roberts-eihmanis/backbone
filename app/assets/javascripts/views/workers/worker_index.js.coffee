class Inventory.Views.WorkersIndex extends Backbone.View
  template: JST['workers/index']
  otherTemplate: JST['workers/prev_index']

  events:
    'keyup .search'          : 'search'
    'click .ex_workers'      : 'exWorkers'
    'click .cur_workers'     : 'showWorkers'

  initialize: ->
    @listenTo @collection, 'search', @renderWorkers
    @listenTo @collection, 'change', @render

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
    @delegateEvents(@events)
    $('.current_workers').hide()
    unless $('.ex_container').length > 0
      @$el.append(@otherTemplate())
      exWorkers = @collection.where(active: false)
      exWorkers.forEach (worker) ->
        exWorkerView = new Inventory.Views.ExWorkerShow(model: worker)
        $('.ex_workers_container').append(exWorkerView.render().el)
    else
      $('.ex_container').show()

  showWorkers: ->
    $('.ex_container').hide()
    $('.current_workers').show()
