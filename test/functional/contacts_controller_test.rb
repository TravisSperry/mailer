require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CONTACT.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CONTACT.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CONTACT.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to contact_url(assigns(:contact))
  end

  def test_edit
    get :edit, :id => CONTACT.first
    assert_template 'edit'
  end

  def test_update_invalid
    CONTACT.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CONTACT.first
    assert_template 'edit'
  end

  def test_update_valid
    CONTACT.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CONTACT.first
    assert_redirected_to contact_url(assigns(:contact))
  end

  def test_destroy
    contact = CONTACT.first
    delete :destroy, :id => contact
    assert_redirected_to contacts_url
    assert !CONTACT.exists?(contact.id)
  end
end
