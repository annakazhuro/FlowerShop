class OrderPdf < Prawn::Document
  def initialize(order, view)
    font_families.update(
        'Russian' => { bold: "#{Prawn::DATADIR}/fonts/Anonymous_Pro_B.ttf",
                    italic: "#{Prawn::DATADIR}/fonts/Anonymous_Pro_I.ttf",
                    bold_italic: "#{Prawn::DATADIR}/fonts/Anonymous_Pro_BI.ttf",
                    normal: "#{Prawn::DATADIR}/fonts/Anonymous_Pro.ttf" })
    super(top_margin: 70)
    @order = order
    @view = view
    font("Russian") do
      order_number
      line_items
      total_price
    end
  end

  def order_number
    text "Заказ \##{@order.id}", size: 30, style: :bold
    text "Заказчик: #{@order.name}"
    text "Номер телефона: #{@order.phone}"
    text "Email: #{@order.email}"
    text "Способ опраты: #{@order.pay_type}"
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.header = true
    end
  end

  def line_item_rows
    [["Продукт", "Количество", "Цена за единицу", "Полная цена"]] +
        @order.line_items.map do |item|
          [item.product.title, item.quantity, price(item.product.price), price(item.product.price * item.quantity)]
        end
  end

  def total_price
    move_down 15
    text "Итоговая цена: #{price(@order.line_items.map(&:quantity).sum)}", size: 16, style: :bold
  end

  private

  def price(n)
    @view.number_to_currency(n, format: "%n BYN")
  end
end