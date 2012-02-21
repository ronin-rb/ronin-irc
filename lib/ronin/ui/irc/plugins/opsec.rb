module Ronin
  module UI
    module IRC
      class Plugin

        include Cinche::Plugin

        protected

        #
        # The Users authorized to control the bot.
        #
        # @return [Array<String>]
        #   The nicknames of the authorized users.
        #
        # @api semipublic
        #
        def authorized
          @bot.config.authorized
        end

        def authorize!(user)
          authorized << user.nick
        end

        def is_authorized(user)
          if authorized.include?(user.nick)
            yield
          else
            User(user).msg "#{self.class.plugin} requires authorization"
          end
        end

        def opped_in(channel)
          if channel.opped?(@bot.nick)
            yield
          else
            channel.msg("#{self.class.plugin} requires OPs")
          end
        end

      end
    end
  end
end
