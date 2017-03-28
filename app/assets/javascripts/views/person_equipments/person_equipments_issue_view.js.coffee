class Inventory.Views.PersonEquipmentIssue extends Backbone.View
  template: JST['person_equipments/issue']

  events:
    'click .save' : 'save'
    'click .cancel' : 'cancel'
    'change select.org_unit' : 'renderWorkers'

  templateAttributes: ->
    workers = @collection.toJSON()
    _.extend { workers }, @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
    @$('#datepicker').datepicker(dateFormat: "dd.mm.yy")
    @

  renderWorkers: ->
    workers = @collection
    element = @$('select.workers')
    orgUnit = @$('select.org_unit').val()
    unless orgUnit == -1
      unitWorkers = workers.where(unit: orgUnit)
    for unitWorker in unitWorkers
      worker = unitWorker.toJSON()
      option = $("<option>", value: worker.id, text: "#{worker.first_name} #{worker.last_name}")
      element.append option
    false

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
