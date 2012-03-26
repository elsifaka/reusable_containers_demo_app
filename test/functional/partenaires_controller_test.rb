require 'test_helper'

class PartenairesControllerTest < ActionController::TestCase
  setup do
    @partenaire = partenaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partenaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partenaire" do
    assert_difference('Partenaire.count') do
      post :create, partenaire: @partenaire.attributes
    end

    assert_redirected_to partenaire_path(assigns(:partenaire))
  end

  test "should show partenaire" do
    get :show, id: @partenaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partenaire
    assert_response :success
  end

  test "should update partenaire" do
    put :update, id: @partenaire, partenaire: @partenaire.attributes
    assert_redirected_to partenaire_path(assigns(:partenaire))
  end

  test "should destroy partenaire" do
    assert_difference('Partenaire.count', -1) do
      delete :destroy, id: @partenaire
    end

    assert_redirected_to partenaires_path
  end
end
