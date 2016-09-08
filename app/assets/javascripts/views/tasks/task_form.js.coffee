class Todo.Views.TaskForm extends Backbone.View
  template: JST['tasks/form']
  
  events: {
    'click .save' : 'save'
  }  

  render: ->
    html = @template
    @$el.html html
    @

  save: (e)->
    console.log 'Save now'
    e.preventDefault()
    newTask = @.$('input[name=name]').val()
    @.model.save({name: newTask})

