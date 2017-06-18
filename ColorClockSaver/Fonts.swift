import AppKit

class Fonts {
  static let timeFont = "mononoki-Regular"
  static let colorCodeFont = "mononoki-Regular"

  static func load(fontName name: String, extension suffix: String) {
    let bundle = Bundle(for: self)
    guard
      let url = bundle.url(forResource: name, withExtension: suffix)
    else {
      fatalError("Could not load font: \(name).\(suffix)")
    }

    var error: Unmanaged<CFError>? = nil
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
    if error != nil {
      NSLog(String(describing: error))
    }
  }
}
