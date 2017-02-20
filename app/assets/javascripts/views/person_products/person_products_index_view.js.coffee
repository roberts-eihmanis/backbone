class Inventory.Views.PersonProductIndex extends Backbone.View
  template: JST['person_equipments/index']

  templateAttributes: ->

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderJournal()
    @

  renderJournal: ->
    journalView = new Inventory.Views.PersonProductShow
    @$('.journal').append(journalView.render().el)