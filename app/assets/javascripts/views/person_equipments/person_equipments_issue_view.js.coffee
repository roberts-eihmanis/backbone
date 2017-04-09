class Inventory.Views.PersonEquipmentIssue extends Backbone.View
  template: JST['person_equipments/issue']

  events:
    'click .save' : 'save'
    'click .cancel' : 'cancel'
    'change select.org_unit' : 'renderWorkers'
    'change select.equipment_category' : 'equipmentAutocomplete'

  templateAttributes: ->
    workers = @collection[0].toJSON()
    users = @collection[1].toJSON()
    _.extend { workers, users }

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
    @$('.date').datepicker(dateFormat: "dd.mm.yy")
    @

  equipmentAutocomplete: ->
    element = @$('select.size')
    category = $('.equipment_category').val()
    collection = @collection[2].where(category: category, worker_id: null)
    equipmentCollection = @collection[2]
    titles = collection.map (equipment) ->
      equipment.toJSON().title
    @$('.equipment').autocomplete(
      delay: 300
      source: titles
      minLength: 1
      select: (event, ui) ->
        element.empty()
        equipments = equipmentCollection.where(category: category, title: ui.item.value)
        for equipment in equipments
          eq = equipment.toJSON()
          option = $("<option>", value: eq.size, text: eq.size)
          element.append option
    )
    @

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

  save: (e) ->
    e.preventDefault()
    size = @$('select.size').val()
    title = @$('input.equipment').val()
    id = @collection[2].where(size: size, title: title)[0].toJSON().id
    model = new Inventory.Models.PersonEquipment(id: id)
    worker = @$('select.workers').val()
    user = @$('select.users').val()
    issueDate = @$('.date').val()
    issuedEquipment = 
      worker_id: worker
      issuer_id: user
      issuer_date: issueDate

    model.save(issuedEquipment,
      success: ->
        Backbone.history.navigate('#person_equipments', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
