# Funkcija, kas atbild par IAL izsniegšanas kārtību
# Funckijas klase mantojas no Backbone bibliotēka
class Inventory.Views.PersonEquipmentIssue extends Backbone.View
  # Skats, kurā notiks funkciju apstrādē
  # Skats, kurā tiks renderēts visi dati, kas atnāk no servera
  template: JST['person_equipments/issue']

  # Darbības, kuras klausās uz katru darbību ko lietotājs veiks
  # Attiecīgi šajā gadījumā, pie katras darbības izpildes notiks viena no funkcijām
  # Piemērs ---> Lietotājs nomaina Struktūrvienību, kur strāda Lietotājs un tiek parādīti visi darbinieki
  # kuri strādā vai atrodas tajā struktūrvienībā
  events:
    'click .save' : 'save'
    'click .cancel' : 'cancel'
    'change select.org_unit' : 'renderWorkers'
    'change select.equipment_category' : 'equipmentAutocomplete'

  # Mainīgie dati, kas tiks padietu uz mums iepriekš minēto skatu
  templateAttributes: ->
    workers = @collection[0].toJSON()
    users = @collection[1].toJSON()
    _.extend { workers, users }

  # Apstrādes funkcija, kas notiks, kad lietotājs nokļūs uz Izsniegšanas lapu
  # Skatam tiks padoti mainīgie dati, un šim skatam, kuram jau ir iedots kāds elements DOMā tur viņš tiks renderēts
  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
    # izmantojam jquery bibliotēkas datepicker funkciju, lai attēlotu skaistu kalendārīti pie nospiešanas
    @$('.date').datepicker(dateFormat: "dd.mm.yy")
    @

  # Izmantojam jquery bibiliotēju autocomplete
  # Attiecīgi izvēlamies kategoriju un 
  equipmentAutocomplete: ->
    element = @$('select.size')
    category = $('.equipment_category').val()
    collection = @collection[2].where(category: category, worker_id: null)
    equipmentCollection = @collection[2]
    titles = collection.map (equipment) ->
      equipment.toJSON().title
    @$('.equipment').autocomplete(
      delay: 300
      source: titles
      minLength: 1
      select: (event, ui) ->
        element.empty()
        equipments = equipmentCollection.where(category: category, title: ui.item.value)
        for equipment in equipments
          eq = equipment.toJSON()
          option = $("<option>", value: eq.size, text: eq.size)
          element.append option
    )
    @

  # Pēc struktūrvienību ievadīšanas dabonam darbiniekus kuri strādā tajā struktūrvienībā
  # un pieliekam viņus pie mūsu iepriekš izveidotā skata datiem
  # Piemēram --> ja Lietotājs izvēlas darbiniekus, Administrācijas nodaļā, tiek parādīti visi
  # darbinieki kuri ir administrācijas nodaļā
  renderWorkers: ->
    workers = @collection[0]
    @$('select.workers').empty()
    element = @$('select.workers')
    orgUnit = @$('select.org_unit').val()
    unless orgUnit == -1
      unitWorkers = workers.where(unit: orgUnit, active: true)
    for unitWorker in unitWorkers
      worker = unitWorker.toJSON()
      option = $("<option>", value: worker.id, text: "#{worker.first_name} #{worker.last_name}")
      element.append option
    false

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#person_equipments', trigger: true)

  # Funkcija, kas dabon struktūrvienības
  getUnits: ->
    orgUnits = []
    for unit in Object.keys(Inventory.config.positions)
      orgUnits.push(unit)
    orgUnits

  # Funkcija, kas dabonot struktūrvienības viņas apstrādā un ieliek mūsu iepriekš definētā skatā
  renderOrgUnits: ->
    element = @$('select.org_unit')
    element.append $("<option>",
        value: -1
        text: "Visi"
      )
    for unit in @getUnits()
      option = $("<option>", value: unit, text: unit)
      element.append option
    false

  # Datu saglabāšanas funkcija, dati kas nosūtās uz Ruby on Rails serveri
  # Kur tālāk viņus apstrāda ruby kontroliera funkcijas
  # Savācam datus, no visiem ievadītiem laukiem un padodam tālāk
  save: (e) ->
    e.preventDefault()
    size = @$('select.size').val()
    title = @$('input.equipment').val()
    issueDate = @$('.date').val()
    id = @collection[2].where(worker_id: null, size: size, title: title)[0].toJSON().id
    model = new Inventory.Models.PersonEquipment(id: id)
    worker = @$('select.workers').val()
    user = @$('select.users').val()
    issuedEquipment = 
      worker_id: worker
      issuer_id: user
      issuer_date: issueDate

    model.save(issuedEquipment,
      success: ->
        Backbone.history.navigate('#person_equipments', trigger: true)
      error: (model, error) ->
        console.log "#{model} Error: #{error}"
    )
