# encoding: UTF-8

module Codereport
  class Document
    attr_accessor :title, :paths, :extensions

    TEMPLATE = <<-EOF
      <h1><%= title %></h1>
      <%= content %>
    EOF

    def initialize(title, paths, extensions)
      self.title = title
      self.paths = paths
      self.extensions = extensions
    end

    def to_file(filename, format)
      output_name = "#{filename}.#{format}"
      html = ERB.new(TEMPLATE).result(binding)

      if format == "pdf"
        pdfkit = PDFKit.new(html, :page_size => "A4")
        pdfkit.stylesheets << File.expand_path(File.dirname(__FILE__)) + '/assets/css/document.css'
        pdfkit.stylesheets << File.expand_path(File.dirname(__FILE__)) + '/assets/css/pygments.css'
        pdfkit.to_pdf(output_name)
      elsif format == "html"
        File.open(output_name, "w") { |f| f.write(html) }
      end
    end

    private

    def content
      "".tap do |res|
        paths.each do |path|
          if File.directory?(path)
            Dir["#{path}/**/*#{extensions_pattern}"].each do |file_path|
              res << render_file(file_path) unless File.directory?(file_path)
            end
          elsif File.exists?(path)
            res << render_file(path)
          else
            puts "WARNING: File or directory not found: #{path}"
          end
        end
      end
    end

    def extensions_pattern
      ".{#{extensions.join(',')}}"
    end

    def render_file(path)
      SourceFile.new(path).render
    end
  end
end
