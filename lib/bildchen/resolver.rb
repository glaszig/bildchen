module Bildchen

  class Resolver

    attr_reader :uri

    def initialize url
      @uri = URI.parse url
    end

    def resolve options = { timeout: 2 }
      candidates.detect do |candidate|
        downloadable? candidate, options
      end
    end

  protected

    def candidates
      @candidates ||= [].tap do |a|
        uri.path.count('/').times do |i|
          path     = uri.path
          path_tpl = [path, '%{favicon}'].compact.join('/')

          paths = apply_icon_names path_tpl
          paths.each do |p|
            dupe = uri.dup
            dupe.path = p
            a << dupe
          end
        end
      end.uniq.sort { |a, b| a.to_s <=> b.to_s }
    end

    def apply_icon_names template
      ICON_NAMES.map { |name| template % { favicon: name } }
    end

    def downloadable? url, options
      Net::HTTP.start(url.host, url.port) do |http|
        http.read_timeout = options[:timeout]
        (200..399).include? http.request_head(url.path).code.to_i
      end
    end

  end

end
