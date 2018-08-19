# frozen_string_literal: true

require 'csv'
require 'http'
require 'nokogiri'
require 'kramdown'

module VerifyUrls
  class Reader
    attr_reader :file, :file_path

    def initialize(file_path, file_format = nil)
      @file = File.read(file_path)
      @file_path = file_path
      @file_format = file_format
    end

    def urls
      case file_format.to_s.downcase
      when 'markdown', 'md' then markdown_urls(file)
      when 'html' then html_urls(file)
      when 'csv' then csv_urls(file)
      else
        raise(ArgumentError, "unknown format #{file_format}")
      end
    end

    def file_format
       @file_format || @file_path.split('.').last
    end

    private

    def csv_urls(file)
      CSV.parse(file).map(&:first).compact
    end

    def html_urls(file)
      document = Nokogiri::HTML(file)
      document.css('a').map { |e| e['href'] }.compact
    end

    def markdown_urls(file)
      html = Kramdown::Document.new(file).to_html
      html_urls(html)
    end
  end
end
