require 'test_helper'

class TaxonomiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxonomies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxonomy" do
    assert_difference('Taxonomy.count') do
      post :create, :taxonomy => { }
    end

    assert_redirected_to taxonomy_path(assigns(:taxonomy))
  end

  test "should show taxonomy" do
    get :show, :id => taxonomies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => taxonomies(:one).to_param
    assert_response :success
  end

  test "should update taxonomy" do
    put :update, :id => taxonomies(:one).to_param, :taxonomy => { }
    assert_redirected_to taxonomy_path(assigns(:taxonomy))
  end

  test "should destroy taxonomy" do
    assert_difference('Taxonomy.count', -1) do
      delete :destroy, :id => taxonomies(:one).to_param
    end

    assert_redirected_to taxonomies_path
  end
end
