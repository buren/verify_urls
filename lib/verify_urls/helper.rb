# frozen_string_literal: true

require 'http'
require 'uri'

module VerifyUrls
  module Helper
    def self.response_success?(response)
      code = response&.code
      code && code >= 200 && code < 300
    end

    def self.GET(url)
        HTTP.follow.get(url)
    rescue HTTP::Error => _e
    end

    def self.absolute_url?(url)
      uri = URI.parse(url)
      return false unless uri.hostname
      return false unless uri.scheme
      return false unless uri.absolute?
      true
    end
  end
end
