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
require 'ronin/formatting/binary'

module Ronin
  module UI
    module IRC
      module Plugins
        class Base64 < Plugin

          match /base64 (encode|decode) (.+)/

          usage "STRING"
          summary "Base64 Encode a String"

          def execute(m,method,str)
            msg_filter(m) do
              if method == "encode"
                encode_string = str.base64_encode.chomp
                m.reply("#{encode_string}")
              elsif method == "decode"
                decode_string = str.base64_decode.chomp
                m.reply("#{decode_string}")
              elsif
                m.reply("jbc22 is being a bitch....oh and i dont have a clue what you want me to do")
              end
            end
          end

        end
      end
    end
  end
end
