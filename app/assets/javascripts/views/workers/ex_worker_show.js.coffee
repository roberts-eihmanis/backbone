class Inventory.Views.ExWorkerShow extends Backbone.View
  template: JST['workers/ex_show']
  tagName: 'tr'
  className: 'row_worker'

  events:
    'click td'       : 'open'
    'click .recover' : 'recover'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  open: ->
    Backbone.history.navigate("#workers/show/#{@model.id}", trigger: true)

  recover: ->
    @model.save({active: true, end_at: null},
      success: ->
        Backbone.history.navigate("#workers", trigger: true)
      error: ->
        alert "Nevarēja atjaunot"
      )