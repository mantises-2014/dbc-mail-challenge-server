require 'spec_helper'

describe ApiToken do
  before do
    @api_token = ApiToken.create!
  end

  it "should generate token" do
    expect(@api_token.token).not_to be_blank
  end

  describe "throttle_requests" do

    context "new api token" do
      before do
        @api_token.throttle_requests
      end
      it "should not throttle" do
        expect(@api_token).to_not be_throttled
      end
    end

    context "with too many requests but not been throttled" do
      before do
        @api_token.request_count = 21
        @api_token.throttle_requests
      end
      it "should throttle" do
        expect(@api_token).to be_throttled
      end
    end

    context "with too many requests but throttled 2 minutes ago" do
      before do
        @api_token.request_count = 21
        @api_token.throttled_at = 2.minutes.ago
        @api_token.throttle_requests
      end
      it "should not throttle" do
        expect(@api_token).to_not be_throttled
      end
    end

  end

end
