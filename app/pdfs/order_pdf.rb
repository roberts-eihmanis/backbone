class OrderPdf < Prawn::Document
  def initialize(order)
    super(top_margin: 70)
    font_families.update("OpenSans" => {
      :normal => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
      :italic => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
      :bold => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
      :bold_italic => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf")
    })
    font "OpenSans"
    @order = order
    order_number
    line_items
    line_item_rows
  end

  delegate :equipment_orders, to: :order

  def order_number
    text "Pasūtijums \##{@order.id}".to_s, size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows, :cell_style => { :size => 9, :text_color => "737373" } do
      cells.padding = 12
      cells.borders = []
      rows(1..50).borders = [:bottom]
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).text_color = "000000"
      columns(0..7).borders = [:right, :bottom]
      columns(0..8).width = 60
      row(0).columns(0..7).borders = [:bottom, :right]
    end
  end

  def line_item_rows
    length = @order.equipment_orders.count
    i = 1
    data = []
    @order.equipment_orders.each do |item|
      data << [
        i,
        item.worker.try(:first_name), 
        item.worker.last_name, 
        item.worker.height, 
        item.worker.breast_size,
        item.worker.hip_size,
        item.worker.waist_size,
        item.person_equipment.title, 
        item.count
      ]
      i += 1
    end
    
    [["Nr.p.k", "Vards", "Uzvards", "Augums", "Krutis", "Gurni", "Viduklis", "Nosaukums", "Skaits"]] + data
    
  end
end