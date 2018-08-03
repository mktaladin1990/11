class Admin::ProductsController < ApplicationController

    ############################
    def index
      a = params[:categories]
      p "````````````````````````````"
      p  a
      @products = Product.all
      if a.present? == true
        c1= Category.find_by_id(a)
        @products =c1.products
      end
      @user= current_user
      authorize [:admin, @products]
      @categories = Category.all
    end


    #############################



end
