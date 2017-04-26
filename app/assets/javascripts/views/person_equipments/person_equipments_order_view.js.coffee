class Inventory.Views.PersonEquipmentsOrder extends Backbone.View
  template: JST['person_equipments/order']

  events:
    'click .cancel'                : 'cancel'
    'change select.org_unit'       : 'renderWorkers'
    'click .add_equipment_order'   : 'addEquipmentOrder'
    'click .make_order'            : 'makeOrder'

  initialize: ->
    @listenTo @collection[2], 'add', @render

  templateAttributes: ->
    @model.toJSON()

  render: ->
    @$el.html(@template(@templateAttributes()))
    @renderOrgUnits()
    @equipmentAutocomplete()
    @renderEquipmentOrders()
    @collection[2].fetch()
    @

  renderEquipmentOrders: ->
    @unorderedEquipments = @collection[2].where(order_id: null)
    @$('.equipment_orders').empty()
    @unorderedEquipments.forEach (equipmentOrder) =>
      equipmentOrderView = new Inventory.Views.EquipmentOrdersView(model: equipmentOrder, collection: @collection)
      @$('.equipment_orders').append(equipmentOrderView.render().el)
    @

  cancel: (e) ->
    e?.preventDefault()
    Backbone.history.navigate('#person_equipments', trigger: true)

  getUnits: ->
    orgUnits = []
    for unit in Object.keys(Inventory.config.positions)
      orgUnits.push(unit)
    orgUnits

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

  renderWorkers: ->
    workers = @collection[0]
    @$('select.workers').empty()
    element = @$('select.workers')
    orgUnit = @$('select.org_unit').val()
    unless orgUnit == -1
      unitWorkers = workers.where(unit: orgUnit)
    for unitWorker in unitWorkers
      worker = unitWorker.toJSON()
      option = $("<option>", value: worker.id, text: "#{worker.first_name} #{worker.last_name}")
      element.append option
    false

  equipmentAutocomplete: ->
    collection = @collection[1]
    titles = collection.map (equipment) ->
      equipment.toJSON().title
    @$('.equipment').autocomplete(
      delay: 300
      source: titles
      minLength: 1
    )
    @

  addEquipmentOrder: (e) ->
    equipmentOrder = new Inventory.Models.EquipmentOrder
    e.preventDefault()
    worker = @$el.find('select.workers').val()
    title = @$el.find('input[name=equipment]').val()
    equipmentCount = @$el.find('select.count').val()
    personEquipmentId = @collection[1].where(title: title)[0].toJSON().id
    equipmentOrder.save({person_equipment_id: personEquipmentId, worker_id: worker, count: equipmentCount}
      success: =>
        @collection[2].trigger('add')
      error: ->
        alert "Nevarēja saglabāt"
    )

  makeOrder: (e) ->
    e.preventDefault()
    date = new Date()
    newOrder = 
      created_at: date
      status: "ordered"
    @model.save(newOrder,
      success: (model) =>
        @updateEquipments(model)
      error: ->
        alert "Nekas nenotika"
      wait: true
    )
    @

  updateEquipments: (model) ->
    @unorderedEquipments.forEach (equipment) ->
      equipment.save(order_id: model.id)
    Backbone.history.navigate('#home', trigger: true)

