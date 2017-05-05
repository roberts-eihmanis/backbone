window.Inventory =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  config: {
    positions: {
      "Administrācija": ["Golfa Laukuma admininstrators", "Valdes Loceklis", "Prokūrists", "Golfa Kompleksa Pārvaldnieks"], 
      "Uzturēšanas nodaļa": ["Dārzkopības tehniķis", "Golfa Laukuma uzturēšanas nodaļas speciālists", "Golfa Laukuma laistīšanas sistēmas speciālists"], 
      "Apkopes Daļa": ["Golfa Laukuma tehniskais speciālists", "Golfa Laukuma mehāniķis"] }
    userRoles: ["admin", "user", "worker"]
    manafacturerCountries: ["Afganistāna", "Albānija", "Alžīrija", "Andora", "Angola", "Angilja", "Antigua Barbuda", "Argentīna", "Armenia", "Aruba", "Austrālija", "Austrija", "Azerbaidžāna", "Bahamu salas", "Bahreina", "Bangladeša", "Barbadosa", "Baltkrievija", "Beļģija", "Beliza", "Benina", "Bermuda", "Butāna", "Bolīvija", "Bosnija un Hercogovina ", "Botsvāna ","Brazil"," Britu Virdžīnu salas ","Bruneja","Bulgārija","Burkinafaso","Burundi","Kambodža","Kamerūna","Kaboverde", "Kaimanu salas", "Čada", "Čīle", "China", "Kolumbija", "Kongo", "Kuka salas", "Kostarika", "Kotdivuāra", "Horvātija", "Cruise Ship", "Cuba", "Kipra", "Čehijas Republika", "Dānija", "Džibutija", "Dominika", "Dominikānas Republika", "Ekvadora", "Ēģipte", "El Salvador", "Ekvatoriālā Gvineja", "Igaunija "," Etiopija "," Folklenda salu "," Farēru salas "," Fidži "," Somija "," Francija "," franču Polinēzija "," French West Indies "," Gabona "," Gambija "," Georgia ", "Vācija", "Gana", "Gibraltārs", "Grieķija", "Grenlande", "Grenada", "Guam", "Gvatemala", "Guernsey", "Gvineja", "Gvineja-Bisava", "Gajāna", "Haiti", "Hondurasa", "Honkonga", "Ungārija", "Isela un "," India "," Indonēzija "," Irāna "," Irāka "," Īrija "," Menas sala "," Izraēla "," Itālija "," Jamaica "," Japan "," Jersey "," Jordan "," Kazahstāna "," Kenija "," Kuwait "," Kirgizstāna "," Laosa "," Latvija "," Libāna "," Lesoto "," Libērija "," Lībija "," Lihtenšteina "," Lietuva "," Luksemburga "," Makao "," Maķedonija "," Madagaskara "," Malavi "," Malaizija "," Maldīvu salas "," Mali "," Malta "," Mauritānija "," Maurīcija "," Meksika ", "Moldova", "Monaco", "Mongolija", "Melnkalne", "Montserrat", "Maroka", "Mozambika", "Namībija", "Nepāla", "Nīderlande", "Nīderlandes Antiļas", "Jaunkaledonija", "New Zealand", "Nikaragva", "Nigēra", "Nigērija", "Norvēģija", "Omāna", "Pakistāna", "Palestīna", "Panama", "Papua Jaungvineja", "Paragvaja", "Peru", "Filipīnas", "Polija", "Portugāle", "Puerto Rico", "Katara", "Reunion", "Rumānija", "Krievija", "Ruanda", "Saint Pierre & amp; Mikelona "," Samoa "," San Marino "," Satellite "," Saūda Arābija "," Senegāla "," Serbija "," Seišelu salas "," Sierra Leone "," Singapore "," Slovākija "," Slovēnija", "Dievindiāfrika", "Dievinvidkoreja", "Spānija", "Šrilanka", "Sentkitsa & amp; Nevis "," St Lucia "," St Vincent "," St. Lucia "," Sudāna "," Surinama "," Svazilenda "," Zviedrija "," Šveice "," Sīrija "," Taivāna "," Tadžikistāna "," Tanzānija "," Taizeme "," Timor L'Este ", "Togo", "Tonga", "Trinidad & amp; Tobago "," Tunisija "," Turcija "," Turkmenistāna "," Turks & amp; Kaikosas "," Uganda "," Ukraina "," Apvienotie Arābu Emirāti "," Apvienotā Karaliste "," Urugvaja "," Uzbekistāna "," Venecuēla "," Vjetnama "," Virdžīnu salas (ASV) "," Jemena", "Zambija", "Zimbabve"]
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
    re = new RegExp(/([admin\/users\/a-z,0-9])/i)
    unless location.hash or location.pathname != '/'
      Backbone.history.navigate 'home', trigger: true

$(document).ready ->
  Inventory.initialize()
