import AppKit

class Fonts {
  static let timeFont = "mononoki-Regular"
  static let colorCodeFont = "mononoki-Regular"

  static func load(fontName name: String, extension suffix: String) {
    guard
      let url = Bundle.main.url(forResource: name, withExtension: suffix)
    else {
      fatalError("Could not load font: \(name).\(suffix)")
    }

    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }
}
