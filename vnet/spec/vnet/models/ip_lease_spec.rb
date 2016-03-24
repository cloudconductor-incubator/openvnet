# -*- coding: utf-8 -*-
require 'spec_helper'

describe Vnet::Models::IpLease do
  let(:interface1) { Fabricate(:interface) }
  let(:interface2) { Fabricate(:interface) }

  let!(:ip_lease_i1_1) do
    network = Fabricate(:network)
    ipv4_address = random_ipv4_i
    mac_lease = Fabricate(:mac_lease, interface: interface1)
    ip_address = Fabricate(:ip_address,
                           network_id: network.id,
                           ipv4_address: ipv4_address)
    Fabricate(:ip_lease,
              mac_lease: mac_lease,
              ip_address: ip_address)
  end

  let!(:ip_lease_i1_2) do
    network = Fabricate(:network)
    ipv4_address = random_ipv4_i
    mac_lease = Fabricate(:mac_lease, interface: interface1)
    ip_address = Fabricate(:ip_address,
                           network_id: network.id,
                           ipv4_address: ipv4_address)
    Fabricate(:ip_lease,
              mac_lease: mac_lease,
              ip_address: ip_address)
  end

  let!(:ip_lease_i2_1) do
    network = Fabricate(:network)
    ipv4_address = random_ipv4_i
    mac_lease = Fabricate(:mac_lease, interface: interface2)
    ip_address = Fabricate(:ip_address,
                           network_id: network.id,
                           ipv4_address: ipv4_address)
    Fabricate(:ip_lease,
              mac_lease: mac_lease,
              ip_address: ip_address)
  end

  describe "cookie_id" do
    it { expect(ip_lease_i1_1.cookie_id).to eq 1 }
    it { expect(ip_lease_i1_2.cookie_id).to eq 2 }
    it { expect(ip_lease_i2_1.cookie_id).to eq 1 }
  end
end
