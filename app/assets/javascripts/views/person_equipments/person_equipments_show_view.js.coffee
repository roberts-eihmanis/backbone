class Inventory.Views.PersonEquipmentShow extends Backbone.View
  template: JST['person_equipments/show']
  tagName: 'tr'

  templateAttributes: ->
    user = @collection[0].where(id: @model.get('issuer_id'))[0].toJSON()
    worker = @collection[1].where(id: @model.get('worker_id'))[0].toJSON()
    _.extend { user, worker }, @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @