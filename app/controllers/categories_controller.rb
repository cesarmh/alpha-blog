class CategoriesController < ApplicationController
  
    before_action :require_admin, except: [:index, :show] 
    
    def index
        @categories = Category.paginate(page: params[:page],per_page: 5)
    end
    
    def new
         @category = Category.new
    end
    
    def create
        @category = Category.new(category_parms)
        if @category.save
            flash[:notice] = "Category was created succesfully"
            redirect_to categories_path
        else
            render 'new'
        end
    end
    def show
        @category = Category.find(params[:id])
        @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
        
    end
    
    def edit
        @category = Category.find(params[:id])
        
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update(category_parms)
            flash[:success] = "Category name was succesfully updated"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end
    
    private
    
    def category_parms
        params.require(:category).permit(:name)
    end
    def require_admin
        if !logged_in? ||(logged_in? and !current_user.admin)
            flash[:danger] = " only admin can perform that action"
            redirect_to categories_path
        end
    end
        

end