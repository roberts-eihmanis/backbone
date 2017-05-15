class Inventory.Views.ArchiveEquipmentView extends Backbone.View
  template: JST['archives/equipment']
  tagName: 'tr'

  events:
    'click td' : 'addMoreEquipment'

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @

  addMoreEquipment: ->
    additionalView = new Inventory.Views.AdditionalEquipmentView(model: @model)
    body = $(document).find('#page-content-wrapper')
    body.prepend(additionalView.render().el)
