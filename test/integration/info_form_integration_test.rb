require 'test_helper'

class InfoFormIntegrationTest < ActionDispatch::IntegrationTest
  test '#create' do
    assert_difference 'InfoForm.count', 1 do
      post '/info_forms',
        as: :json,
        params: { info_form: { name: 'Person', event_id: Event.last.id } }
      assert_response :success
    end
  end
end
