require 'test_helper'

class MailerEventsControllerTest < ActionController::TestCase
  setup do
    @mailer_event = mailer_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mailer_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mailer_event" do
    assert_difference('MailerEvent.count') do
      post :create, mailer_event: { company: @mailer_event.company, date: @mailer_event.date, description: @mailer_event.description, link: @mailer_event.link, name: @mailer_event.name }
    end

    assert_redirected_to mailer_event_path(assigns(:mailer_event))
  end

  test "should show mailer_event" do
    get :show, id: @mailer_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mailer_event
    assert_response :success
  end

  test "should update mailer_event" do
    patch :update, id: @mailer_event, mailer_event: { company: @mailer_event.company, date: @mailer_event.date, description: @mailer_event.description, link: @mailer_event.link, name: @mailer_event.name }
    assert_redirected_to mailer_event_path(assigns(:mailer_event))
  end

  test "should destroy mailer_event" do
    assert_difference('MailerEvent.count', -1) do
      delete :destroy, id: @mailer_event
    end

    assert_redirected_to mailer_events_path
  end
end
