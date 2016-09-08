class Todo.Models.Task extends Backbone.Model
  urlRoot : '/tasks'

  defaults = [
    name: 'What you want to do?'
    completed: 'false'
  ]

  initialize: ->
    console.log 'Model' 


  
