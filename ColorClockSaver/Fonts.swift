import AppKit

class Fonts {
  static let timeFont = "mononoki-Regular"
  static let colorCodeFont = "mononoki-Regular"

  static func load(fontName name: String, extension suffix: String) {
    guard
      let bundle = Bundle(identifier: "com.edwardloveall.ColorClockSaver"),
      let url = bundle.url(forResource: name, withExtension: suffix)
    else {
      fatalError("Could not load font: \(name).\(suffix)")
    }

    var error: Unmanaged<CFError>? = nil
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
    NSLog(String(describing: error))
  }
}
