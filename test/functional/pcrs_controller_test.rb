require 'test_helper'

class PcrsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcr" do
    assert_difference('Pcr.count') do
      post :create, :pcr => { }
    end

    assert_redirected_to pcr_path(assigns(:pcr))
  end

  test "should show pcr" do
    get :show, :id => pcrs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pcrs(:one).to_param
    assert_response :success
  end

  test "should update pcr" do
    put :update, :id => pcrs(:one).to_param, :pcr => { }
    assert_redirected_to pcr_path(assigns(:pcr))
  end

  test "should destroy pcr" do
    assert_difference('Pcr.count', -1) do
      delete :destroy, :id => pcrs(:one).to_param
    end

    assert_redirected_to pcrs_path
  end
end
