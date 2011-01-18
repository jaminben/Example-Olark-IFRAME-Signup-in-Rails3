require 'test_helper'

class OlarksControllerTest < ActionController::TestCase
  setup do
    @olark = olarks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:olarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create olark" do
    assert_difference('Olark.count') do
      post :create, :olark => @olark.attributes
    end

    assert_redirected_to olark_path(assigns(:olark))
  end

  test "should show olark" do
    get :show, :id => @olark.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @olark.to_param
    assert_response :success
  end

  test "should update olark" do
    put :update, :id => @olark.to_param, :olark => @olark.attributes
    assert_redirected_to olark_path(assigns(:olark))
  end

  test "should destroy olark" do
    assert_difference('Olark.count', -1) do
      delete :destroy, :id => @olark.to_param
    end

    assert_redirected_to olarks_path
  end
end
