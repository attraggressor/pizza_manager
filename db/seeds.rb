ingredients = %w( szynka boczek cebula ser oliwki czosnek pieczarki ananas salami papryka kukurydza jalapeno )

p 'Creating ingredients'
ingredients.each do |i|
  print '.'
  Ingredient.create!(name: i)
end
print "Finished!\n\n"


products = %w( Margharita Funghi Vesuvio Capricciosa Hawai Roma Big Ben Tropicana Salvatore Vegetariana Carbonara 
  Peperone Chili Calzone Husets Desperado Primavera Sandra Paolla Awangarda Sorento Diabolo Speciale Torino Pescatore 
  Mafia Acapulco )

p 'Creating products and assigning ingredients'
products.each do |p|
  print '.'
  product = Product.create!(
    name: p, 
    price: sprintf("%.2f", (rand(12.5...33.5).to_f * 2).ceil.to_f / 2)
    )

  Ingredient.all.map(&:id).shuffle.sample((3..Ingredient.count).to_a.sample).each do |i|
    ProductIngredient.create!(product_id: product.id, ingredient_id: i)
    print '.'
  end
end
print "Finished!\n\n"


p 'Creating Company Branches'
CompanyBranch.create!(name: 'PizzAria Wadowice', address_line: 'Rynek Główny 13', address_zip_code: '34-100', address_city: 'Wadowice')
print '.'
CompanyBranch.create!(name: 'PizzAria Warszawa', address_line: 'Rynek Główny 14', address_zip_code: '34-100', address_city: 'Warszawa')
print '.'
CompanyBranch.create!(name: 'PizzAria Kraków', address_line: 'Rynek Główny 17', address_zip_code: '34-100', address_city: 'Kraków')
print '.'
CompanyBranch.create!(name: 'PizzAria Wrocław', address_line: 'Rynek Główny 24', address_zip_code: '34-100', address_city: 'Wrocław')
print '.'
CompanyBranch.create!(name: 'PizzAria Gdynia', address_line: 'Rynek Główny 5', address_zip_code: '34-100', address_city: 'Gdynia')
print "Finished!\n\n"

p 'Creating Business Hours for each Company Branch'
CompanyBranch.all.each do |cb|
  %w(mon tue wed thu fri sat sun).each do |day|
    print '.'
    business_hour = BusinessHour.new
    business_hour.day = day.to_s
    business_hour.company_branch_id = cb.id
    business_hour.open_time = Time.parse( '00:00:00' )  
    business_hour.close_time = Time.parse( '00:00:00' )  
    business_hour.save   
  end
end

print "Finished!\n\n"

p 'Creating Product <=> Company Branch association samples' 
CompanyBranch.all.each do |cb|
  Product.all.map(&:id).shuffle.sample((5..Product.count).to_a.sample).each do |p|
    print '.'
    CompanyBranchProduct.create!(company_branch_id: cb.id, product_id: p)
  end  
end
print "Finished!\n\n"
