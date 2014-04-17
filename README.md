# MusicSanitizer

Sanitizes music related data. Used internally @ [Radiofy](http://radiofy.se).

## Installation

    $ gem install music_sanitizer

## Usage

``` ruby
MusicSanitizer::Processor.new("Will.I.Am Ft. Justin Bieber").process # => "will.i.am"
```

Take a look at the `spec/processor_spec.rb` file for more examples.

## Contributing

1. Fork it ( http://github.com/oleander/music_sanitizer-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request