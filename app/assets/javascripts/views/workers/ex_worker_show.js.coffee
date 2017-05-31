class Inventory.Views.ExWorkerShow extends Backbone.View
  template: JST['workers/ex_show']
  tagName: 'tr'
  className: 'row_worker'

  events:
    'click .recover' : 'recover'
    'click .save'    : 'save' 

  initialize: ->
    @listenTo @model, 'change', @render

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  open: ->
    Backbone.history.navigate("#workers/show/#{@model.id}", trigger: true)

  recover: (e) ->
    dateView = new Inventory.Views.WorkerDateView(model: @model)
    $('body').prepend dateView.render().el