# -*- coding: utf-8 -*-

module Vnet::Constants::ActivePort
  MODE_INTERFACE = 'interface'
  MODE_LOCAL = 'local'
  MODE_TUNNEL = 'tunnel'
  MODE_UNKNOWN = 'unknown'

  MODES = [MODE_INTERFACE,
           MODE_LOCAL,
           MODE_TUNNEL,
           MODE_UNKNOWN,
          ]
end
