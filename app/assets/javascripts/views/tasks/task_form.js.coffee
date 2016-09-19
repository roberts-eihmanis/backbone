class Todo.Views.TaskForm extends Backbone.View
  template: JST['tasks/form']
  
  events: {
    'click .save' : 'save'
  }  
  
  templateAttributes: ->
    name: @model.get("name")
    completed: @model.get("completed")
    id: @model.get('id')

  render: ->
    html = @template(@templateAttributes())
    @$el.html html
    @

  save: (e)->
    console.log 'Save now'

    e.preventDefault()
    newName = @$el.find('input[name=name]').val()
    newStatus = @$el.find('input[name=completed]').prop('checked')
    @model.save(name: newName, completed: newStatus, 
      success: =>
        @$el.empty()
        Backbone.history.navigate('', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}" 
    )
    @

