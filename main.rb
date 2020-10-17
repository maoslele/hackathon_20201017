class Product
  attr_reader :name, :price
  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class Machine
  def initialize(product_params)
    @products = []
    register(product_params)
    @got_money
    @order
  end

def register(product_params)
  product_params.each do |param|
    @products << Product.new(param)
  end
end

  def show
    puts "セブン自販機へようこそ"
    puts "----------------------"
    @products.each.with_index(1) do |product, i|
      puts "#{i}:#{product.name}" "(¥#{product.price})"
    end
    puts "----------------------"
  end

  def put
    print "お金を投入してください(例：120) > "
    @got_money = gets.chomp.to_i
  end

  def select
    print "商品番号を選択して下さい > "
    @order = gets.chomp.to_i
    order = @products[@order-1].name
    puts "#{order}を選びました"
    puts "----------------------"
  end

  def calc
    payback = @got_money - @products[@order-1].price
    if payback < 0
      puts "代金が不足しています(#{payback})"
    elsif payback >= 0
      puts "お釣りは#{payback}です"
    end
  end
end

product1 = [
  { name: "オレンジジュース", price: 150},
  { name: "缶コーヒー", price: 110},
  { name: "ジンジャーエール", price: 150},
  { name: "牛乳", price: 120},
  { name: "いちごオレ", price: 130},
  { name: "水", price: 100},
  { name: "お茶", price: 100},
]

machine = Machine.new(product1)
machine.show
machine.put
machine.select
machine.calc