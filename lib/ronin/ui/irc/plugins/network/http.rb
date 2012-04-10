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
require 'ronin/network/http'
require 'uri/query_params'

module Ronin
  module UI
    module IRC
      module Plugins
        class HTTP < Plugin

          include Ronin::Network::HTTP

          match /(?:http_banner) (.+) (.+)/, :method => :banner
          match /(?:parse|http_parse) (.+)/, :method => :parse
          
          usage "[HOST] [PORT]"
          summary "Retrieve the HTTP banner of remote host"

          def banner(m,host,port)
            msg_filter(m) do
            result = http_server(:url => "http://#{host}:#{port}")
              if result
                m.reply(result)
              else
                m.reply("Banner Not Found")
              end
            end
          end
        
          def parse(m,str)
            msg_filter(m) do
              uri = URI(str)
              if uri.scheme
                m.reply("scheme: #{uri.scheme}")
              end
              if uri.host
                m.reply("host: #{uri.host}")
              end
              if uri.port
                m.reply("port: #{uri.port}")
              end
              if uri.path
                m.reply("path: #{uri.path}")
              end
              unless uri.query_params.empty?
                m.reply("query_params: #{uri.query_params}")
              end
              if uri.fragment
                m.reply("fragments: #{uri.fragment}")
              end
            end
          end
        
        end
      end
    end
  end
end
