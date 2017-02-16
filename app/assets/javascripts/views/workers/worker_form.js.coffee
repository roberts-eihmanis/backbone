class Inventory.Views.WorkerForm extends Backbone.View
  template: JST['workers/form']
  
  events: {
    'click .save' : 'save'
    # 'click .cancel': 'cancel'
  }
  
  templateAttributes: ->
    @model.toJSON()

  render: ->
    html = @template(@templateAttributes())
    @$el.html html
    @

  save: (e) ->
    e.preventDefault()
    firstName = @$el.find('input[name=first_name]').val()
    lastName = @$el.find('input[name=last_name]').val()
    newGender = @$el.find('select.gender').val()
    newPosition = @$el.find('select.position').val()
    newBreast = @$el.find('select.breast').val()
    newWaist = @$el.find('select.waist').val()
    newHip = @$el.find('select.hip').val()
    newHeight = @$el.find('select.height').val()
    newFoot = @$el.find('select.foot').val()

    @model.save(first_name: firstName, last_name: lastName, gender: newGender, position: newPosition, breast_size: newBreast,
      waist_size: newWaist, hip_size: newHip, height: newHeight, foot_size: newFoot,
      success: =>
        @$el.empty()
        Backbone.history.navigate('#workers', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
    @

