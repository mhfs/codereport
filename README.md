# Codereport

Codereport was born from a bureaucratic need to generate a PDF document
of a Rails app source code.

It also outputs HTML.

See an example here: [myreport.pdf](http://f.cl.ly/items/0D3k2L3y433e0m2I2b3V/myreport.pdf)

## Installation

Even though this project has the structure of a gem and even a gemspec I
didn't want to release yet another gem. If you want it to be a gem open an
issue and let me know.

Just clone the repo or add it to your Gemfile and use it
programmatically (see cli.rb for an example).

## Dependencies

Codereport depends on [Pygments](http://pygments.org/docs/installation/).

## Usage

Clone the repo, run `bundle install` and use the executable like this:

```
bundle exec bin/codereport
```

Full usage info:

```
Usage:
  codereport generate --title=TITLE

Options:
  --title=TITLE
  [--paths=one two three]
                                # Default: ["."]
  [--output=OUTPUT]
                                # Default: output
  [--format=FORMAT]
                                # Default: pdf
  [--extensions=one two three]
```

A real world example:

```
bundle exec bin/codereport generate --title ISSIntegral --paths ./lib/codereport.rb ./lib/codereport/
--format html --extensions rb --output myreport
```

## Limitations

I only mapped a few extensions to Pygments' highlighters. See
language_detector.rb and open an issue if you want more extensions.

## TODO

* Write tests #facepalm

## Contributing

Fork the [Codereport repository on GitHub](https://github.com/mhfs/codereport)
and send a Pull Request.

## License

MIT License. Copyright 2012 Marcelo Silveira. http://mhfs.com.br
