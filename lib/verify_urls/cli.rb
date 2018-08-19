# frozen_string_literal: true

require 'optparse'

module VerifyUrls
  class CLI
    def self.parse(argv:)
      options = {}
      OptionParser.new do |parser|
        parser.banner = 'Usage: verify_urls --help'
        parser.default_argv = argv

        parser.on('--file=README.md', String, 'The file that contains the URLs to verify.') do |string|
          options[:file] = string
        end

        parser.on('--format=markdown', String, "The file format (optional) - one of markdown, html, csv (if none given we'll try to infer it from the file path).") do |string|
          options[:format] = string
        end

        parser.on('--output=output.csv', String, 'CSV Output path') do |string|
          options[:output] = string
        end

        parser.on('--[no-]error-failed', 'Exit with non-zero status if any URL(s) failed.') do |boolean|
          options[:error_failed] = boolean
        end

        parser.on('-h', '--help', 'How to use') do
          puts parser
          exit
        end
      end.parse!
      options
    end
  end
end
