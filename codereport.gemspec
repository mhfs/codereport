# -*- encoding: utf-8 -*-
require File.expand_path('../lib/codereport/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcelo Silveira"]
  gem.email         = ["marcelo@mhfs.com.br"]
  gem.description   = %q{Command line utility to generate a beautiful PDF from source code}
  gem.summary       = %q{If for any weird reason you need to generate a PDF with your source code this simple command line tool will be handy.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "codereport"
  gem.require_paths = ["lib"]
  gem.version       = Codereport::VERSION

  gem.add_runtime_dependency "thor"
  gem.add_runtime_dependency "pdfkit"
  gem.add_runtime_dependency "wkhtmltopdf-binary"
  gem.add_runtime_dependency "albino"
  gem.add_runtime_dependency "escape_utils"
end
