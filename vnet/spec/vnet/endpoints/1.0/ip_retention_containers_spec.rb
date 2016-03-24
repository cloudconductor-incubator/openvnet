require 'spec_helper'
require 'vnet'
Dir["#{File.dirname(__FILE__)}/shared_examples/*.rb"].map {|f| require f }
Dir["#{File.dirname(__FILE__)}/matchers/*.rb"].map {|f| require f }

def app
  Vnet::Endpoints::V10::VnetAPI
end

describe "/ip_retention_containers" do
  before(:each) { use_mock_event_handler }
  let(:api_suffix)  { "ip_retention_containers" }
  let(:fabricator)  { :ip_retention_container }
  let(:model_class) { Vnet::Models::IpRetentionContainer }

  include_examples "GET /"
  include_examples "GET /:uuid"
  include_examples "DELETE /:uuid"

  describe "POST /" do
    accepted_params = {
      lease_time: 3600,
      grace_time: 3600
    }
    required_params = []
    uuid_params = [:uuid]

    include_examples "POST /", accepted_params, required_params, uuid_params
  end

  describe "PUT /:uuid" do
    accepted_params = {}

    include_examples "PUT /:uuid", accepted_params
  end

  describe "GET /:uuid/ip_retentions" do
    let(:ip_retention_container) { Fabricate(:ip_retention_container) }

    before do
      3.times { Fabricate(:ip_retention, ip_retention_container: ip_retention_container) }
    end

    it "returns 3 ip_retentions" do
      get "/ip_retention_containers/#{ip_retention_container.canonical_uuid}/ip_retentions"

      expect(last_response).to succeed.with_body_containing({
        "total_count" => 3,
        "offset" =>  0,
        "limit" => Vnet::Configurations::Webapi.conf.pagination_limit,
      })

      expect(JSON.parse(last_response.body)["items"].size).to eq 3
    end
  end
end
