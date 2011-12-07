require 'spec_helper'
require 'watirmark_bvt/site'

describe "Getting the site info from BVT" do
  before :all do
    @site = WatirmarkBVT::Site.new('qa309.bvt3.corp.convio.com')
  end

  specify "should be able to see the site_id" do
    @site.site_id.should > 0
  end

  specify "should define a database connection" do
    @site.database.username.should_not be_nil
    @site.database.password.should_not be_nil
    @site.database.url.should =~ /\.corp\.convio\.com/
    @site.database.sid.should_not be_nil
    @site.database.port.should > 0
  end

  specify "should raise an error for an unknown site" do
    lambda {
      WatirmarkBVT::Site.new('unknown.bvt3.corp.convio.com')
    }.should raise_error(WatirmarkBVT::RestClientError)
  end

  specify 'should be able to reset the hostname' do
    WatirmarkBVT.hostname = 'test.corp.convio.com'
    WatirmarkBVT.hostname.should == 'test.corp.convio.com'
  end
end