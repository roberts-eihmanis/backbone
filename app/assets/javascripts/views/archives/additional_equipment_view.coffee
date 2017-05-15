class Inventory.Views.AdditionalEquipmentView extends Backbone.View
  template: JST['archives/additional_equipment']
  tagName: 'div'
  className: 'popup_container'

  events:
    'click .save'   : 'save'
    'click .cancel' : 'cancel'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @$('.purchased_at').datepicker(dateFormat: "dd.mm.yy")
    @

  cancel: (e) ->
    e?.preventDefault()
    @remove()

  save: (e) ->
    e.preventDefault()
    attributes = @model.toJSON()
    model = new Inventory.Models.PersonEquipment
    newPrice = @$el.find('input[name=price]').val()
    purchasedAt = @$el.find('input[name=purchased_at]').val()
    newCount = @$el.find('select.count').val()
    saveAttributes =
      title: attributes.title
      price: newPrice
      purchased_at: purchasedAt
      category: attributes.category
      count: newCount
      size: attributes.size
      price: attributes.price
      manafacturer: attributes.manafacturer

    model.save(saveAttributes,
      success: =>
        @remove()
      error: ->
        alert "Kaut kas nogāja greizi"
      wait: true
    )



