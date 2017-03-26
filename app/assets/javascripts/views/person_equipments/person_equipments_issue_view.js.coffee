class Inventory.Views.PersonEquipmentIssue extends Backbone.View
  template: JST['person_equipments/issue']

  events:
    'click .cancel' : 'cancel'

  templateAttributes: ->
    workers = @collection.toJSON()
    _.extend { workers }, @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
    # @$('.datepicker').datepicker()
    @

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#person_equipments', trigger: true)

  getUnits: ->
    orgUnits = []
    for unit in Object.keys(Inventory.config.positions)
      orgUnits.push(unit)
    orgUnits

  renderOrgUnits: ->
    element = @$('select.org_unit')
    element.append $("<option>",
        value: -1
        text: "Visi"
      )
    for unit in @getUnits()
      option = $("<option>", value: unit, text: unit)
      element.append option
    false