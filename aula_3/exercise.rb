# Exercício: Sistema de Vendas

require_relative './sales_report'

sales = [
  { product: 'Notebook', category: 'Eletrônicos', amount: 3000 },
  { product: 'Celular', category: 'Eletrônicos', amount: 1500 },
  { product: 'Cadeira', category: 'Móveis', amount: 500 },
  { product: 'Mesa', category: 'Móveis', amount: 1200 },
  { product: 'Headphone', category: 'Eletrônicos', amount: 300 },
  { product: 'Armário', category: 'Móveis', amount: 800 }
]

sr = SalesReport.new(sales)

# 1. Incluir Enumerable e implementar #each para iterar sobre as vendas.
sr.each { |sale| puts sale }

# 2. Um método #total_by_category que retorna um hash com o total de vendas por categoria.
puts sr.total_by_category

# 3. Um método #top_sales(n) que retorna os n maiores valores de venda.
puts sr.top_sales(2)

# 4. Um método #grouped_by_category que retorna um hash com os produtos agrupados por categoria.
puts sr.grouped_by_category

# 5. Um método #above_average_sales que retorna as vendas cujo valor está acima da média geral.
puts sr.above_average_sales
