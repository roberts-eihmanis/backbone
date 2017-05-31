class Inventory.Views.WorkerDateView extends Backbone.View
  template: JST['workers/date']
  className: 'popup_container'

  events:
    'click .save'    : 'save'

  render: ->
    @$el.html @template(@model.toJSON())
    @$('.start_at').datepicker(dateFormat: 'dd.mm.yy')
    @

  save: (e) =>
    date = $('input[name=start_at]').val()
    @model.save({active: true, end_at: null, start_at: date},
      success: =>
        @remove()
        Backbone.history.navigate("#workers", trigger: true)
      error: ->
        alert "Nevarēja atjaunot"
      )
