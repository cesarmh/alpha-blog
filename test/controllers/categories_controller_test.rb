require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
     
     
     def setup 
         @category = Category.create(name: "sports")
     end
     test "Should get categories index" do
         get :index
          #get categories_path
          assert_response :success
     end
    
    test "should get new" do
         get :new
          #get new_categories_path
          assert_response :success
    end
    
    test "should get show" do
         get(:show,{'id' => @category.id}) 
         # get categories_path
          assert_response :success
        
    end
end