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

require 'cinch'

module Ronin
  module UI
    module IRC
      #
      # @api semipublic
      #
      class Plugin

        include Cinch::Plugin

        #
        # The command name for the plugin.
        #
        # @return [String]
        #   The command name.
        #
        def self.command_name
          @command_name ||= self.name.split('::').last.downcase
        end

        #
        # Sets or returns the usage for the plugin.
        #
        # @param [String] summary
        #   The new summary for the plugin.
        #
        # @return [String]
        #   The summary of the plugin.
        #
        def self.usage(usage=nil)
          if usage
            @usage = usage
          else
            @usage ||= nil
          end
        end

        #
        # Sets or returns the summary for the plugin.
        #
        # @param [String] summary
        #   The new summary for the plugin.
        #
        # @return [String]
        #   The summary of the plugin.
        #
        def self.summary(summary=nil)
          if summary
            @summary = summary
          else
            @summary ||= nil
          end
        end

        protected

        #
        # Determines if the bot has ops in the channel.
        #
        # @param [Cinch::Channel] channel
        #   The channel the bot might have ops in.
        #
        # @yield []
        #
        def has_ops_in(channel)
          if channel
            if channel.opped?(@bot.nick)
              yield
            else
              channel.msg("#{self.class.command_name} requires OPs")
            end
          end
        end

      end
    end
  end
end
