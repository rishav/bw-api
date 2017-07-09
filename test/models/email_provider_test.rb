require 'test_helper'

class EmailProviderTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  test 'should get active provider' do
     email_provider = create(:email_provider, status: true)
     assert_equal email_provider.id, EmailProvider.active_providers.first.id
  end
end
