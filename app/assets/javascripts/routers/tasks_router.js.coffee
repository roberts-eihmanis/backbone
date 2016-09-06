class Todo.Routers.Tasks extends Backbone.Router
  routes:
    '' : 'index'
    'tasks/' : 'index'
    'tasks' : 'index'
    
  # initialize: ->
    # alert "hop" 

  index: ->
    t1 = new Todo.Models.Task(name: 'test1', completed: false)
    t2 = new Todo.Models.Task(name: 'test2', completed: true)
    t3 = new Todo.Models.Task(name: 'test3', completed: false)

    tc = new Todo.Collections.Tasks([t1, t2, t3])
    tv = new Todo.Views.TasksIndex(collection: tc)
    tv.render()

    $('#task_list').html(tv.el)
    # alert "aa"