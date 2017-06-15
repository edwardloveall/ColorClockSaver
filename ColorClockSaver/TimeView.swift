import Cocoa

class TimeView: NSView {
    override func draw(_ dirtyRect: NSRect) {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    let dateString = formatter.string(from: date)

    let storage = NSTextStorage(string: dateString)
    storage.font = NSFont(name: "mononoki", size: 100)
    let layoutManager = NSLayoutManager()
    let textContainer = NSTextContainer()
    layoutManager.addTextContainer(textContainer)
    storage.addLayoutManager(layoutManager)

    let glyphRange = layoutManager.glyphRange(for: textContainer)
    self.lockFocus()
    layoutManager.drawGlyphs(forGlyphRange: glyphRange, at: bounds.origin)
    self.unlockFocus()
  }
}
