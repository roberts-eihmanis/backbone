class Inventory.Views.PersonProductIssue extends Backbone.View
  template: JST['person_equipments/issue']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @