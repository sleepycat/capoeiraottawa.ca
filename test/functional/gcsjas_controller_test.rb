require 'test_helper'

class GcsjasControllerTest < ActionController::TestCase
  setup do
    @gcsja = gcsjas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gcsjas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gcsja" do
    assert_difference('Gcsja.count') do
      post :create, :gcsja => @gcsja.attributes
    end

    assert_redirected_to gcsja_path(assigns(:gcsja))
  end

  test "should show gcsja" do
    get :show, :id => @gcsja.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @gcsja.to_param
    assert_response :success
  end

  test "should update gcsja" do
    put :update, :id => @gcsja.to_param, :gcsja => @gcsja.attributes
    assert_redirected_to gcsja_path(assigns(:gcsja))
  end

  test "should destroy gcsja" do
    assert_difference('Gcsja.count', -1) do
      delete :destroy, :id => @gcsja.to_param
    end

    assert_redirected_to gcsjas_path
  end
end
