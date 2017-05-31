class Inventory.Views.ReportsWorkerView extends Backbone.View
  template: JST['reports/workers']

  events:
    'change select.org_unit' : 'renderWorkers'
    'click .search'          : 'search'

  templateAttributes: ->
    @collection[1].toJSON()

  initialize: ->
    @listenTo @collection[1], 'reset', @renderData

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderData()
    @renderOrgUnits()
    @$('.datepicker').datepicker(dateFormat: "dd.mm.yy")
    @

  search: (e) ->
    e.preventDefault()
    $('.by_period').empty()
    dateLte = @$el.find('input[name=date_lte]').val()
    dateGte = @$el.find('input[name=date_gte]').val()
    worker = @$el.find('select.workers').val()
    @collection[1].search(worker, dateGte, dateLte)
    @collection[1].fetch({reset:true})

  renderData: ->
    @collection[1].each (model) =>
      dataView = new Inventory.Views.ReportsWorkersView(model: model)
      @$('.by_period').append(dataView.render().el)
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
