require "test_helper"

class QrCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_qr" do
    get qr_codes_generate_qr_url
    assert_response :success
  end
end
