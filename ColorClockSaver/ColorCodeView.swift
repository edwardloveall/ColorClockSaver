import Cocoa

class ColorCodeView: NSTextField {
  let colorGen = ColorGenerator()

  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  func setup() {
    drawsBackground = false
    isBezeled = false
    isBordered = false
    isEditable = false
    font = NSFont(name: Fonts.colorCodeFont, size: 0)
  }

  func update() {
    stringValue = colorGen.hexColorFromTime()
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.0212
    font = NSFont(name: Fonts.colorCodeFont, size: newFontSize)
  }
}
