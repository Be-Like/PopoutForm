require 'test_helper'

class EventIntegrationTest < ActionDispatch::IntegrationTest

  test '#index html' do
    get '/'
    assert_response :success
    assert_select 'div', 'VueForm Goes Here'
  end

  test '#index json' do
    get '/events.json'
    assert_response :success

    assert_equal JSON.parse(response.body)['events'].length, Event.all.size
  end
end
