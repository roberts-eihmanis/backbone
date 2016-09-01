window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    #alert 'Hello from Backbone!'
    new Todo.Routers.Tasks
    Backbone.history.start()  

$(document).ready ->
  Todo.initialize()
