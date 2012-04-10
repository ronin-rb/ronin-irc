# encoding: utf-8
#
# Copyright (c) 2012 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of Ronin UI IRC.
#
# Ronin Ui Irc is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Ronin Ui Irc is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ronin Ui Irc.  If not, see <http://www.gnu.org/licenses/>.
#

require 'ronin/ui/irc/plugin'
require 'ronin/network/dns'

module Ronin
  module UI
    module IRC
      module Plugins
        class DNS < Plugin

          include Ronin::Network::DNS

          match /(?:dns|dns_lookup) (.+)/, :method => :lookup
          match /(?:dns_all|dns_lookup_all) (.+)/, :method => :lookup_all
          match /(?:dns_reverse|dns_reverse_lookup) (.+)/, :method => :reverse_lookup
          match /(?:dns_reverse_all|dns_reverse_lookup_all) (.+)/, :method => :reverse_lookup_all
          
          usage "[dns|dns_all|dns_reverse|dns_reverse_all] DOMAIN"
          summary "Perform DNS lookup on a specifed domain"

          def lookup(m,str)
            msg_filter(m) do
              result = dns_lookup(str)
              if result
                m.reply(result)
              else
                m.reply("No Results Found")
              end
            end
          end
          
          def lookup_all(m,str)
            msg_filter(m) do
              result = dns_lookup_all(str)
              unless result.empty?
                m.reply(result)
              else
                m.reply("No Results Found")
              end
            end
          end

          def reverse_lookup(m,str)
            msg_filter(m) do
              result = dns_reverse_lookup(str)
              if result
                m.reply(result)
              else
                m.reply("No Results Found")
              end
            end
          end
          
          def reverse_lookup_all(m,str)
            msg_filter(m) do
              result = dns_reverse_lookup_all(str)
              unless result.empty?
                m.reply(result)
              else
                m.reply("No Results Found")
              end
            end
          end
        end
        
      end
    end
  end
end
