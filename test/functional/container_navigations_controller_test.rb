require 'test_helper'

class ContainerNavigationsControllerTest < ActionController::TestCase
  setup do
    @container_navigation = container_navigations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:container_navigations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create container_navigation" do
    assert_difference('ContainerNavigation.count') do
      post :create, container_navigation: @container_navigation.attributes
    end

    assert_redirected_to container_navigation_path(assigns(:container_navigation))
  end

  test "should show container_navigation" do
    get :show, id: @container_navigation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @container_navigation
    assert_response :success
  end

  test "should update container_navigation" do
    put :update, id: @container_navigation, container_navigation: @container_navigation.attributes
    assert_redirected_to container_navigation_path(assigns(:container_navigation))
  end

  test "should destroy container_navigation" do
    assert_difference('ContainerNavigation.count', -1) do
      delete :destroy, id: @container_navigation
    end

    assert_redirected_to container_navigations_path
  end
end
