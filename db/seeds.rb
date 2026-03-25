# Seed provinces with correct Canadian tax rates
provinces = [
  { name: "Alberta", abbreviation: "AB", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "British Columbia", abbreviation: "BC", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "Manitoba", abbreviation: "MB", gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "New Brunswick", abbreviation: "NB", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Newfoundland and Labrador", abbreviation: "NL", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Northwest Territories", abbreviation: "NT", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Nova Scotia", abbreviation: "NS", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Nunavut", abbreviation: "NU", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Ontario", abbreviation: "ON", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.13 },
  { name: "Prince Edward Island", abbreviation: "PE", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Quebec", abbreviation: "QC", gst_rate: 0.05, pst_rate: 0.09975, hst_rate: 0.00 },
  { name: "Saskatchewan", abbreviation: "SK", gst_rate: 0.05, pst_rate: 0.06, hst_rate: 0.00 },
  { name: "Yukon", abbreviation: "YT", gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 }
]

provinces.each { |p| Province.find_or_create_by!(abbreviation: p[:abbreviation]).update!(p) }
puts "Seeded #{Province.count} provinces"

# Seed categories
categories = ["Bulk Grains & Legumes", "Spices & Seasonings", "International Pantry", "Specialty Sweets & Mixes"]
categories.each { |name| Category.find_or_create_by!(name: name) }
puts "Seeded #{Category.count} categories"

# Seed pages
Page.find_or_create_by!(slug: "about").update!(
  title: "About Spice & Grain Market",
  body: "Spice & Grain Market Ltd. has been serving Winnipeg's North End since 2011..."
)
Page.find_or_create_by!(slug: "contact").update!(
  title: "Contact Us",
  body: "Visit us at our store on Selkirk Avenue, or reach out by phone or email."
)
puts "Seeded pages"

# Seed products
grains = Category.find_by(name: "Bulk Grains & Legumes")
spices = Category.find_by(name: "Spices & Seasonings")
pantry = Category.find_by(name: "International Pantry")
sweets = Category.find_by(name: "Specialty Sweets & Mixes")

products = [
  { name: "Red Lentils", description: "Split red lentils, perfect for dal and soups.", price: 3.99, stock_quantity: 200, on_sale: false, categories: [grains] },
  { name: "Basmati Rice", description: "Long-grain aged basmati rice from Punjab.", price: 12.99, stock_quantity: 150, on_sale: false, categories: [grains] },
  { name: "Chickpeas", description: "Dried whole chickpeas, great for chana masala.", price: 4.49, stock_quantity: 180, on_sale: false, categories: [grains] },
  { name: "Black Quinoa", description: "Organic black quinoa, high in protein.", price: 8.99, stock_quantity: 80, on_sale: true, sale_price: 6.99, categories: [grains] },
  { name: "Cumin Seeds", description: "Whole cumin seeds, freshly sourced.", price: 2.99, stock_quantity: 300, on_sale: false, categories: [spices] },
  { name: "Turmeric Powder", description: "Bright golden turmeric, finely ground.", price: 3.49, stock_quantity: 250, on_sale: false, categories: [spices] },
  { name: "Garam Masala Blend", description: "House-blended garam masala, warming and aromatic.", price: 5.99, stock_quantity: 120, on_sale: false, categories: [spices] },
  { name: "Sumac", description: "Tangy red sumac powder from the Middle East.", price: 4.99, stock_quantity: 90, on_sale: false, categories: [spices] },
  { name: "Rose Water", description: "Pure rose water for desserts and drinks.", price: 6.49, stock_quantity: 60, on_sale: false, categories: [pantry] },
  { name: "Halwa Mix", description: "Traditional semolina halwa mix, ready to prepare.", price: 7.99, stock_quantity: 70, on_sale: true, sale_price: 5.99, categories: [sweets] }
]

products.each do |attrs|
  cats = attrs.delete(:categories)
  product = Product.find_or_create_by!(name: attrs[:name])
  product.update!(attrs)
  product.categories = cats
end
puts "Seeded #{Product.count} products"