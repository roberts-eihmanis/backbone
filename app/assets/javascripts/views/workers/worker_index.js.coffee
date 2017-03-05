class Inventory.Views.WorkersIndex extends Backbone.View
  template: JST['workers/index']
  className: 'content_container'

  templateAttributes: ->
    @collection.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderWorkers()
    @

  renderWorkers: ->
    @collection.each (worker) =>
      workerView = new Inventory.Views.WorkerShow(model: worker)
      @$('tbody.workers').append workerView.render().el
    @
