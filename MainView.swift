import ScreenSaver

class MainView: ScreenSaverView {
  override func draw(_ rect: NSRect) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    let dateString = formatter.string(from: date)
    let storage = NSTextStorage(string: dateString)
    let layoutManager = NSLayoutManager()
    let textContainer = NSTextContainer()
    layoutManager.addTextContainer(textContainer)
    storage.addLayoutManager(layoutManager)
    let glyphRange = layoutManager.glyphRange(for: textContainer)
    self.lockFocus()
    layoutManager.drawGlyphs(forGlyphRange: glyphRange, at: bounds.origin)
    self.unlockFocus()
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
  }
}
