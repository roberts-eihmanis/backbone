class Inventory.Views.EquipmentOrdersView extends Backbone.View
  template: JST['person_equipments/equipment_order']
  tagName: 'tr'

  events:
    'click .delete_equipment_order': 'delete'

  initialize: ->
    @listenTo @collection[2], 'change', @render

  templateAttributes: ->
    worker = @collection[0].where(id: @model.get('worker_id'))[0].toJSON()
    person_equipment = @collection[1].where(id: @model.get('person_equipment_id'))[0].toJSON()
    _.extend { worker, person_equipment }, @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  delete: =>
    @model.unset("errors", {silent: true})
    @model.destroy(
      success: =>
        @$el.empty()
      error: ->
        alert "Nevarēja izdzēst"
    )
    false
