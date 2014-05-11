require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION

get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION


get '/' do
	temp = []
	@item = Item.all
	@array = @item.sample(10)
	erb :index
end

get '/about' do 
	erb :about
end 

get'/products' do
	@products = Item.all
  	erb :products
end

get '/buy/:id' do
	@product = Item.find(params[:id])
	erb :consumers_form
end
post '/buy/:id' do
	@product = Item.find(params[:id])
	@money = MoneyCalculator.new params[:ones], params[:fives],params[:tens], params[:twenty], params[:fifty], params[:hundred], params[:fhundred], params[:thousand], params[:quantity], @product.price
	if @money.adder.to_f > @money.amount.to_f
		num = params[:quantity].to_f + @product.sold.to_f
		quan = @product.quantity.to_f - params[:quantity].to_f
		@product.update_attributes!(
    		sold: num,
		quantity: quan
  		)
	end

	erb :confirmation
end
