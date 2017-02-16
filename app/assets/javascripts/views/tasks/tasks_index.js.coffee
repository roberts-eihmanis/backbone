class Inventory.Views.TasksIndex extends Backbone.View
  template: JST['tasks/index']

  templateAttributes: ->
    entries: @collection.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderTasks()
    @

  renderTasks: ->
    @collection.each (task) =>
      taskView = new Inventory.Views.TaskShow(model: task)
      @$('.entries').append taskView.render().el
    @
