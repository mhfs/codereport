require "codereport/version"
require "pdfkit"
require "albino"
require "escape_utils"
require "erb"

module Codereport
  autoload :SourceFile,       "codereport/source_file"
  autoload :Document,         "codereport/document"
  autoload :LanguageDetector, "codereport/language_detector"
  autoload :CLI,              "codereport/cli"
end
