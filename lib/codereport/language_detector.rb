# encoding: UTF-8

module Codereport
  class LanguageDetector
    attr_accessor :basename, :extname

    LANGUAGE_FILE = {
      "Gemfile"  => :ruby,
      "Rakefile" => :ruby
    }

    LANGUAGE_EXTENSION = {
      ".rb"     => :ruby,
      ".coffee" => :coffeescript,
      ".js"     => :javascript,
      ".rake"   => :ruby,
      ".css"    => :css,
      ".scss"   => :css,
      ".haml"   => :haml
    }

    def initialize(basename)
      self.basename = basename
      self.extname  = File.extname(basename)
    end

    def detect
      LANGUAGE_EXTENSION[extname] || LANGUAGE_FILE[basename]
    end
  end
end
