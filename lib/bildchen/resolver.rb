module Bildchen

  class Resolver

    attr_reader :uri
    attr_accessor :ssl_verify_mode

    def initialize url
      @uri = URI.parse url
      @ssl_verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    # Returns the url at which a favicon was supposedly found
    def resolve options = { timeout: Bildchen.timeout }
      if path = _resolve(uri.path, options)
        dupe = uri.dup
        dupe.path = path
        dupe.to_s
      end
    end

  protected

    # Recursively tries to HEAD-request the path
    def _resolve path, options = {}
      candidates(path).detect do |path|
        downloadable? path, options
      end || resolve(File.dirname(path), options)
    end

    # HEAD-requests a file
    def downloadable? path, options = {}
      (200..299).include? http(options).head(path, 'User-Agent' => USER_AGENT).code.to_i
    end

    # Interpolates path with '%{favicon}' and returns candidates to probe
    def candidates path
      apply_icon_names File.join File.dirname(path), '%{favicon}'
    end

    def apply_icon_names template
      ICON_NAMES.map { |name| template % { favicon: name } }
    end

    # HTTP client factory
    def http options = {}
      @conn ||= Net::HTTP.new(uri.host, uri.port).tap do |conn|
        conn.open_timeout = options[:timeout]
        conn.read_timeout = options[:timeout]
        conn.use_ssl = (uri.scheme == 'https')
        conn.verify_mode = self.ssl_verify_mode
      end
    end

  end

end
