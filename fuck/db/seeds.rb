
images = [
    "https://product.hstatic.net/1000250895/product/153830cstandard_large.jpg",
    "https://product.hstatic.net/1000250895/product/11_c339f02b13ca4cad8fc329c3123cbebd_large.jpg",
    "https://product.hstatic.net/1000250895/product/142334c_large.jpg",
    "https://product.hstatic.net/1000250895/product/149446cstandard_large.jpg"]    
    prices = ["1,600,000₫","1,700,000₫","1,900,000₫","1,800,000₫"]

Product.delete_all
20.times do |i|    
    p = Product.new
    p.name = "product #{i}"
    p.price = prices[rand(0..(prices.length-1))]
    p.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    p.image = images[rand(0..(images.length-1))]

    p.save
end