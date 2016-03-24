# -*- coding: utf-8 -*-

Fabricator(:lease_policy, class_name: Vnet::Models::LeasePolicy) do
  mode "simple"
  timing "immediate"
end

Fabricator(:lease_policy_with_network, class_name: Vnet::Models::LeasePolicy) do
  mode "simple"
  timing "immediate"
  lease_policy_base_networks(count: 1) do
    Fabricate(:lease_policy_base_network_with_network)
  end
  ip_retention_containers(count:1) { Fabricate(:ip_retention_container) }
end
