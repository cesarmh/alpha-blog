require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
    def setup
        @category = Category.create(name: "books")
        @category2 = Category.create(name: "programming")
        
    end
    
    test "shoud show categories listing" do
        get categories_path
        assert_template 'categories/index'
        assert_select "a[href=?]", category_path(@category), test: @category.name
        assert_select "a[href=?]", category_path(@category2), test: @category.name

        
    end

    
end