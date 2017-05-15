class OrderPdf < Prawn::Document
  def initialize(order)
    super(top_margin: 70)
    @order = order
    order_number
    line_items
    line_item_rows
  end

  delegate :equipment_orders, to: :order

  def order_number
    text "Pasutijums \##{@order.id}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows, :cell_style => { :font => "Helvetica", :size => 10, :text_color => "737373" } do
      cells.padding = 12
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).font_style = :bold
      row(0).text_color = "000000"
      columns(0..7).borders = [:right]
      row(0).columns(0..7).borders = [:bottom, :right]
    end
  end

  def line_item_rows
    length = @order.equipment_orders.count
    data = @order.equipment_orders.map do |item|
      [
        item.worker.first_name, 
        item.worker.last_name, 
        item.worker.height, 
        item.worker.breast_size,
        item.worker.hip_size,
        item.worker.waist_size,
        item.person_equipment.title, 
        item.count
      ]
    end
    for i in 1..length do
      data[0].insert(0, i)
    end
    
    [["Nr.p.k", "Vards", "Uzvards", "Augums", "Krutis", "Gurni", "Viduklis", "Nosaukums", "Skaits"]] + data
    
  end
end