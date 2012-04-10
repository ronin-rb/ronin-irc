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
require 'ronin/formatting/digest'

module Ronin
  module UI
    module IRC
      module Plugins
        class Digest < Plugin

          match /(?:md5) (.+)/, :method => :md5
          match /(?:sha1|sha128) (.+)/, :method => :sha1
          match /(?:sha2|sha256) (.+)/, :method => :sha256
          match /(?:sha512) (.+)/, :method => :sha512

          usage "[digest] [md5|sha1|sha256|sha512] STRING"
          summary "Encode a string as md5,sha1,sha256 or sha512"

          def md5(m,str)
            msg_filter(m) do
              m.reply(str.md5)
            end
          end
          
          def sha1(m,str)
            msg_filter(m) do
              m.reply(str.sha1)
            end
          end

          def sha256(m,str)
            msg_filter(m) do
              m.reply(str.sha256)
            end
          end
          
          def sha512(m,str)
            msg_filter(m) do
              m.reply(str.sha512)
            end
          end
        end
      end
    end
  end
end
