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
require 'uri/query_params'

module Ronin
  module UI
    module IRC
      module Plugins
        class URI < Plugin

          match /uri (.+)/, :method => :uri

          usage 'URI'
          summary "Inspects the URI"

          def uri(m,url)
            msg_filter(m) do
              uri = ::URI(url)

              m.reply("Scheme: #{uri.scheme}") if uri.scheme
              m.reply("Host: #{uri.host}")     if uri.host
              m.reply("Port: #{uri.port}")     if uri.port
              m.reply("Path: #{uri.path}")     if uri.path

              unless uri.query_params.empty?
                m.reply("Query-Params: #{uri.query_params}")
              end

              m.reply("Fragments: #{uri.fragment}") if uri.fragment
            end
          end

        end
      end
    end
  end
end
