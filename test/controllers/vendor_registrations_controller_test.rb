require 'test_helper'

class VendorRegistrationsControllerTest < ActionController::TestCase
  setup do
    @vendor_registration = vendor_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_registration" do
    assert_difference('VendorRegistration.count') do
      post :create, vendor_registration: { ad_fee: @vendor_registration.ad_fee, address: @vendor_registration.address, ages: @vendor_registration.ages, city: @vendor_registration.city, contact: @vendor_registration.contact, email: @vendor_registration.email, late_fee: @vendor_registration.late_fee, organization_name: @vendor_registration.organization_name, phone: @vendor_registration.phone, registration_fee: @vendor_registration.registration_fee, state: @vendor_registration.state, total: @vendor_registration.total, zip: @vendor_registration.zip }
    end

    assert_redirected_to vendor_registration_path(assigns(:vendor_registration))
  end

  test "should show vendor_registration" do
    get :show, id: @vendor_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_registration
    assert_response :success
  end

  test "should update vendor_registration" do
    patch :update, id: @vendor_registration, vendor_registration: { ad_fee: @vendor_registration.ad_fee, address: @vendor_registration.address, ages: @vendor_registration.ages, city: @vendor_registration.city, contact: @vendor_registration.contact, email: @vendor_registration.email, late_fee: @vendor_registration.late_fee, organization_name: @vendor_registration.organization_name, phone: @vendor_registration.phone, registration_fee: @vendor_registration.registration_fee, state: @vendor_registration.state, total: @vendor_registration.total, zip: @vendor_registration.zip }
    assert_redirected_to vendor_registration_path(assigns(:vendor_registration))
  end

  test "should destroy vendor_registration" do
    assert_difference('VendorRegistration.count', -1) do
      delete :destroy, id: @vendor_registration
    end

    assert_redirected_to vendor_registrations_path
  end
end
