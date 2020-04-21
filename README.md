# ASCII Art Script
Turn any picture into an ASCII masterpiece!

## Prereqs

If you don't have homebrew, get it:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

You will also need the ImageMagick cli and bundler.
```
brew install imagemagick
gem install bundler
```

Install dependencies:
```
bundle install
```

## Running

```
ruby project.rb 'path/to/img/file' >> final.txt
open file.txt
```

Congratulations, your masterpiece is now stored in final.txt! You may need to zoom out significantly if the image is large.