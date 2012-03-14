# encoding: UTF-8

module Codereport
  class SourceFile
    attr_accessor :file, :file_path

    TEMPLATE = <<-EOF
      <h2>
        <%= basename %>
        <small><%= dirname %></small>
      </h2>
      <%= content %>
    EOF

    def initialize(path)
      self.file_path = path
      self.file      = File.open(path)
    end

    def render
      ERB.new(TEMPLATE).result(binding)
    end

    private

    def content
      if highlighter
        Albino.colorize(file.read, highlighter)
      else
        puts "WANING: no highlighter available for #{file_path}"
        "<pre>#{EscapeUtils.escape_html(file.read)}</pre>"
      end
    end

    def basename
      File.basename(file_path)
    end

    def dirname
      File.dirname(file_path)
    end

    def extension
      File.extname(file_path)
    end

    def highlighter
      @highlighter ||= LanguageDetector.new(basename).detect
    end
  end
end
