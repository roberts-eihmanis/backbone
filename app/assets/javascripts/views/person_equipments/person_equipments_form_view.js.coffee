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
    category = @$el.find('select.category').val()
    title = @$el.find('input[name=title]').val()
    manafacturer = @$el.find('input[name=manafacturer]').val()
    manafacturerCountry = @$el.find('select.countries').val()
    size = @$el.find('input[name=size]').val()
    category = @$el.find('select.category').val()
    price = @$el.find('input[name=price]').val()
    code = @$el.find('input[name=code]').val()
    warranty = @$el.find('input[name=warranty]').val()
    count = @$el.find('select.count').val()

    saveEquipment = 
      title: title
      manafacturer: manafacturer
      manafacturer_country: manafacturerCountry
      size: size
      price: price
      category: category
      code: code
      warranty: warranty
      count: count

    @model.save(saveEquipment,
      success: =>
        @$el.empty()
        Backbone.history.navigate('#person_equipments', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
    @

