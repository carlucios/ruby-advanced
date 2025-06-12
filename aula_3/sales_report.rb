class SalesReport
  include Enumerable

  def initialize(sales)
    @sales = sales
  end

  def each(&block)
    @sales.each(&block)
  end

  def total_by_category
    category_sales = grouped_by_category
    category_sales.map { |category, sales| [category, sales.sum { |sale| sale[:amount] }] }.to_h
  end

  def top_sales(n)
    @sales.sort_by { |sale| sale[:amount] }.map { |sale| sale[:amount] }.reverse.first(n)
  end

  def grouped_by_category
    @sales.group_by { |sale| sale[:category] }
  end

  def above_average_sales
    average_sales = @sales.sum { |sale| sale[:amount] } / @sales.length
    @sales.select { |sale| sale[:amount] > average_sales }
  end
end
