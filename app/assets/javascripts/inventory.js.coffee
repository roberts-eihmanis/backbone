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
    manafacturerCountries: ["Latvia", "Germany", "Poland", "China", "France"]
    equipmentCategories: ["Cimdi", "Apavi", "Apģērbs", "Aizsarglīdzekļi", "Citi"]
  }
  initialize: ->
    Backbone.history = new Backbone.History
    @rootRouter = new Inventory.Routers.Root
    @workersRouter = new Inventory.Routers.Workers
    @tasksRouter = new Inventory.Routers.Tasks
    @personEquipmentsRouter = new Inventory.Routers.PersonEquipments
    @reportsRouter = new Inventory.Routers.Reports

    Backbone.history.start()

$(document).ready ->
  Inventory.initialize()
