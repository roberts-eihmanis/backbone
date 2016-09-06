class Todo.Models.Task extends Backbone.Model
  # urlRoot : '/tasks'
  defaults = [
    name: 'name'
    completed: 'false'
  ]

  initialize: ->
    console.log "Model"


  
