window.Inventory =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  config: {
    positions: {
      "Administrācija": ["Golfa Laukuma admininstrātors", "Valdes Loceklis", "Prokūrists", "Golfa Kompleksa Pārvaldnieks"], 
      "Uzturēšanas nodaļa": ["Dārzkopības tehniķis", "Golfa Laukuma uzturēšanas nodaļas speciālists", "Golfa Laukuma laistīšanas sistēmas speciālists"], 
      "Apkopes Daļa": ["Golfa Laukuma tehniskais speciālists", "Golfa Laukuma mehāniķis"] }
    userRoles: ["admin", "user", "worker"]
    manafacturerCountries: ["Latvia", "Germany", "Poland", "China"]
  }
  initialize: ->
    Backbone.history = new Backbone.History
    @rootRouter = new Inventory.Routers.Root
    @workersRouter = new Inventory.Routers.Workers
    @tasksRouter = new Inventory.Routers.Tasks
    @PersonEquipmentsRouter = new Inventory.Routers.PersonEquipments

    Backbone.history.start()

$(document).ready ->
  Inventory.initialize()
