class Inventory.Views.Details extends Backbone.View
  template: JST['workers/details']
  templateEdit: JST['workers/edit_details']

  events:
    'click .edit_worker' : 'edit'
    'click .back' : 'back'
    'change select.org_unit' : 'renderPositions'
    'click .save' : 'save'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    html = @template(@templateAttributes())
    @$el.html html
    @

  getUnits: ->
    orgUnits = []
    for unit in Object.keys(Inventory.config.positions)
      orgUnits.push(unit)
    orgUnits

  getPositions: (unit)->
    if unit == '-1'
      @positions()
    else
      Inventory.config.positions[unit]

  positions: ->
    positions = []
    for position in Object.values(Inventory.config.positions)
      for pos in position
        positions.push(pos)
    positions

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

  renderPositions: ->
    @$('select.position').empty()
    unit = @$('select.org_unit').val()
    element = @$('select.position')
    for pos in @getPositions(unit)
      option = $("<option>", value: pos, text: pos)
      element.append option
    false

  save: (e) ->
    e.preventDefault()
    firstName = @$el.find('input[name=first_name]').val()
    lastName = @$el.find('input[name=last_name]').val()
    newGender = @$el.find('select.gender').val()
    newUnit = @$el.find('select.org_unit').val()
    newPosition = @$el.find('select.position').val()
    newBreast = @$el.find('select.breast').val()
    newWaist = @$el.find('select.waist').val()
    newHip = @$el.find('select.hip').val()
    newHeight = @$el.find('select.height').val()
    newFoot = @$el.find('select.foot').val()
    startAt = @$el.find('input[name=start_at]').val()

    saveWorker = 
      first_name: firstName
      last_name: lastName
      gender: newGender
      unit: newUnit
      position: newPosition
      breast_size: newBreast
      waist_size: newWaist
      hip_size: newHip
      height: newHeight
      foot_size: newFoot
      start_at: startAt

    @model.save(saveWorker,
      success: (model) =>
        @$el.empty()
        Backbone.history.navigate('#workers', trigger: true)
      error: (model, error) ->
        alert "Jūs ievadījāt nepareizu vērtību"
    )
    @

  edit: ->
    @$el.html(@templateEdit(@templateAttributes()))
    @$('.start_at').datepicker(dateFormat: "dd.mm.yy")
    @$('.end_at').datepicker(dateFormat: "dd.mm.yy")
    @renderOrgUnits()

  back: ->
    @$el.html(@template(@templateAttributes()))