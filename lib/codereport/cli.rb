# encoding: UTF-8
require "thor"

module Codereport
  class CLI < Thor
    map "-g" => :generate

    desc "generate", "generate a PDF with your source code"

    method_option :title,     :type => :string, :required => true
    method_option :paths,     :type => :array,  :required => false, :default => ["."]
    method_option :output,    :type => :string, :required => false, :default => "output"
    method_option :format,    :type => :string, :required => false, :default => "pdf"
    method_option :extensions,:type => :string, :required => false

    def generate
      Document.new(options[:title], options[:paths], options[:extensions]).to_file(options[:output], options[:format])
    end
  end
end
