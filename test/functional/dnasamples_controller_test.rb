require 'test_helper'

class DnasamplesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dnasamples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dnasample" do
    assert_difference('Dnasample.count') do
      post :create, :dnasample => { }
    end

    assert_redirected_to dnasample_path(assigns(:dnasample))
  end

  test "should show dnasample" do
    get :show, :id => dnasamples(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dnasamples(:one).to_param
    assert_response :success
  end

  test "should update dnasample" do
    put :update, :id => dnasamples(:one).to_param, :dnasample => { }
    assert_redirected_to dnasample_path(assigns(:dnasample))
  end

  test "should destroy dnasample" do
    assert_difference('Dnasample.count', -1) do
      delete :destroy, :id => dnasamples(:one).to_param
    end

    assert_redirected_to dnasamples_path
  end
end
