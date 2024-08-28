module Bildchen
  class Resolver
    attr_reader :uri

    def initialize url
      @uri = URI.parse url
    end

    # Returns the url at which a favicon was supposedly found
    def resolve **options
      if path = _resolve(uri.path, **options)
        uri.merge(path).to_s
      end
    end

    private

      # Recursively tries to HEAD-request the path
      def _resolve path, **options
        candidates(path).detect do |path|
          downloadable? path, **options
        end || _resolve(File.dirname(path), options)
      end

      # HEAD-requests a file
      def downloadable? path, **options
        (200..299).include? http(**options).head(path, 'User-Agent' => USER_AGENT).code.to_i
      end

      # Interpolates path with '%{favicon}' and returns candidates to probe
      def candidates path
        apply_icon_names File.join File.dirname(path), '%{favicon}'
      end

      def apply_icon_names template
        ICON_NAMES.map { |name| template % { favicon: name } }
      end

      # HTTP client factory
      def http timeout: Bildchen.timeout
        @conn ||= Net::HTTP.new(uri.host, uri.port).tap do |conn|
          conn.open_timeout = timeout
          conn.read_timeout = timeout
          conn.use_ssl = (uri.scheme == 'https')
        end
      end
  end
end
