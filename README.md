![A screenshot of the ColorClock Screensaver](./Resources/screenshot.png)

# A ScreenSaver for macOS

[Announcement blog post](https://blog.edwardloveall.com/colorclocksaver)

## Installation

>Note: This screensaver requires macOS Sierra (10.12) or higher.

>Note: There is a bug in System Preferences that may show the screen saver as non-functional. It should work when the screen saver starts for real. If it doesn't, please file an issue [here](https://github.com/edwardloveall/ColorClockSaver/issues). You can read more about the bug in [this article](http://alistairmcmillan.github.io/2016/04/25/OSX-Swift-screensaver-bug.html).

Download the latest [release](https://github.com/edwardloveall/ColorClockSaver/releases/latest) and place it in your `~/Library/Screen Savers/` directory. Then, open System Preferences > Desktop & Screen Saver and select ColorClockSaver from the list.

Alternatively, `install` with [Homebrew](https://brew.sh):

~~~ sh
brew tap edwardloveall/colorclocksaver https://github.com/edwardloveall/ColorClockSaver
brew install --cask colorclocksaver --no-quarantine
~~~
