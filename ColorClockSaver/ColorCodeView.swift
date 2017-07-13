import Cocoa

class ColorCodeView: LabelView {
  override func setup() {
    drawsBackground = false
    isBezeled = false
    isBordered = false
    isEditable = false
    font = NSFont(name: Fonts.colorCodeFont, size: 0)
    backgroundWasLight = Date().asColor().isLight
    textColor = Date().asColor().appropriateBlackOrWhite()
  }

  func update() {
    let date = Date()
    let dateColor = date.asColor()
    stringValue = date.asHexColorString()

    if dateColor.isLight != backgroundWasLight  {
      let blackOrWhite = dateColor.appropriateBlackOrWhite()
      fade(to: blackOrWhite.withAlphaComponent(preventBurnInAlpha))
    }
    backgroundWasLight = dateColor.isLight
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.0212
    font = NSFont(name: Fonts.colorCodeFont, size: newFontSize)
  }
}
