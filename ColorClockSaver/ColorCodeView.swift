import Cocoa

class ColorCodeView: LabelView {
  override func setup() {
    drawsBackground = false
    isBezeled = false
    isBordered = false
    isEditable = false
    font = NSFont(name: Fonts.colorCodeFont, size: 0)
    backgroundWasLight = Date().asColor().isLight
  }

  func update() {
    let date = Date()
    let dateColor = date.asColor()
    stringValue = date.asHexColorString()

    if dateColor.isLight != backgroundWasLight  {
      fade(to: dateColor.appropriateBlackOrWhite())
    }
    backgroundWasLight = dateColor.isLight
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.0212
    font = NSFont(name: Fonts.colorCodeFont, size: newFontSize)
  }
}
