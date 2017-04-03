class Inventory.Views.WorkerForm extends Backbone.View
  template: JST['workers/form']
  
  events: 
    'click .save'  : 'save'
    'click .cancel': 'cancel'
    'change select.org_unit' : 'renderPositions'
  
  templateAttributes: ->
    @model.toJSON()

  render: ->
    html = @template(@templateAttributes())
    @$el.html html
    @renderOrgUnits()
    @renderPositions()
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
    debugger
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

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#workers', trigger: true)

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

    @model.save(saveWorker,
      success: =>
        @$el.empty()
        Backbone.history.navigate('#workers', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
    @
