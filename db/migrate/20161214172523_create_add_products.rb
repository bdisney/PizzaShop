class CreateAddProducts < ActiveRecord::Migration[5.0]
  def change

  	Product.create :title => 'Hawaiian pizza', :description => 'This is Hawaiian pizza', :price => 350, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/hawaii.png'

  	Product.create :title => 'Pepperoni', :description => 'Nice Pepperoni pizza', :price => 450, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => '/images/pepperoni.png'

  	Product.create :title => 'Margarita', :description => 'This is pizza Margarita', :price => 400, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => '/images/margarita.png'
 
  end
end
