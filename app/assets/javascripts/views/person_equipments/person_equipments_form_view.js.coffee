class Inventory.Views.PersonEquipmentForm extends Backbone.View
  template: JST['person_equipments/form']

  events: {
    'click .save' : 'save'
    'click .cancel': 'cancel'
  }

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#person_equipments', trigger: true)

  save: (e) ->
    e.preventDefault()
    title = @$el.find('input[name=title]').val()
    manafacturer = @$el.find('input[name=manafacturer]').val()
    manafacturerCountry = @$el.find('select.manafacturer_country').val()
    size = @$el.find('input[name=size]').val()
    price = @$el.find('input[name=price]').val()
    code = @$el.find('input[name=code]').val()
    count = @$el.find('input[name=count]').val()
    debugger
    saveEquipment = 
      title: title
      manafacturer: manafacturer
      manafacturer_country: manafacturerCountry
      size: size
      price: price
      code: code
      count: count

    @model.save(saveEquipment,
      success: =>
        @$el.empty()
        Backbone.history.navigate('#person_equipments', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
    @

