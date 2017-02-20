window.Inventory =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  config: {
    positions: ["Golfa Laukuma uzturēšanas nodaļas vadītājs", "Golfa Laukuma uzturēšanas nodaļas speciālists", 
      "Golfa Laukuma tehniskais speciālists", "Golfa Laukuma mehāniķis", "Golfa Laukuma laistīšanas sistēmas speciālists",
      "Golfa Laukuma admininstrātors", "Dārzkopības tehniķis", "Valdes Loceklis",
      "Prokūrists", "Golfa Kompleksa Pārvaldnieks"]
  }
  initialize: ->
    #alert 'Hello from Backbone!'
    Backbone.history = new Backbone.History
    @rootRouter = new Inventory.Routers.Root
    @workersRouter = new Inventory.Routers.Workers
    @tasksRouter = new Inventory.Routers.Tasks
    @personProductsRouter = new Inventory.Routers.PersonProducts

    Backbone.history.start()

$(document).ready ->
  Inventory.initialize()
