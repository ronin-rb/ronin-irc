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

module Ronin
  module UI
    module IRC
      #
      # @api semipublic
      #
      class Plugin

        include Cinche::Plugin

        protected

        #
        # Determines if the bot has ops in the channel.
        #
        # @param [String] channel
        #   The channel the bot might have ops in.
        #
        # @return [Boolean]
        #   Specifies whether the bot has ops in the channel
        #
        def ops?(channel)
          channel.opped?(@bot.nick)
        end

      end
    end
  end
end
