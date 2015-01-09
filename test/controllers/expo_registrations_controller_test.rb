require 'test_helper'

class ExpoRegistrationsControllerTest < ActionController::TestCase
  setup do
    @expo_registration = expo_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expo_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expo_registration" do
    assert_difference('ExpoRegistration.count') do
      post :create, expo_registration: { email: @expo_registration.email, name: @expo_registration.name, newsletter: @expo_registration.newsletter, year: @expo_registration.year }
    end

    assert_redirected_to expo_registration_path(assigns(:expo_registration))
  end

  test "should show expo_registration" do
    get :show, id: @expo_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expo_registration
    assert_response :success
  end

  test "should update expo_registration" do
    patch :update, id: @expo_registration, expo_registration: { email: @expo_registration.email, name: @expo_registration.name, newsletter: @expo_registration.newsletter, year: @expo_registration.year }
    assert_redirected_to expo_registration_path(assigns(:expo_registration))
  end

  test "should destroy expo_registration" do
    assert_difference('ExpoRegistration.count', -1) do
      delete :destroy, id: @expo_registration
    end

    assert_redirected_to expo_registrations_path
  end
end
