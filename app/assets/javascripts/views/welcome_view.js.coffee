class Inventory.Views.WelcomeView extends Backbone.View
  template: JST['welcome/index']

  render: ->
    @$el.html(@template())
    @