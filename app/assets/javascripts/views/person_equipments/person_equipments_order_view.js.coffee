class Inventory.Views.PersonEquipmentsOrder extends Backbone.View
  template: JST['person_equipments/order']

  events:
    'click .cancel' : 'cancel'

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#person_equipments', trigger: true)