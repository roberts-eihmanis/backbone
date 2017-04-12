class Inventory.Views.PersonEquipmentsOrder extends Backbone.View
  template: JST['person_equipments/order']

  events:
    'click .cancel' : 'cancel'
    'change select.org_unit' : 'renderWorkers'

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
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

  renderWorkers: ->
    workers = @collection[0]
    @$('select.workers').empty()
    element = @$('select.workers')
    orgUnit = @$('select.org_unit').val()
    unless orgUnit == -1
      unitWorkers = workers.where(unit: orgUnit)
    for unitWorker in unitWorkers
      worker = unitWorker.toJSON()
      option = $("<option>", value: worker.id, text: "#{worker.first_name} #{worker.last_name}")
      element.append option
    false

  equipmentAutocomplete: ->

