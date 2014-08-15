require 'spec_helper'

describe ApiToken do
  before do
    @api_token = ApiToken.create!
  end

  it "should generate token" do
    expect(@api_token.token).not_to be_blank
  end

  describe "throttle?" do
    context "with 20 requests" do
      before do
        @api_token.request_count = 20
      end

      it "should throttle" do
        expect(@api_token.throttle?).to be_true
      end
    end

    context "with 5 requests" do
      before do
        @api_token.request_count = 5
      end

      it "should throttle" do
        expect(@api_token.throttle?).to be_false
      end
    end

  end

end
