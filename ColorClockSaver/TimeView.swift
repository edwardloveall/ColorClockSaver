import Cocoa

class TimeView: LabelView {
  override func setup() {
    drawsBackground = false
    isBezeled = false
    isBordered = false
    isEditable = false
    font = NSFont(name: Fonts.timeFont, size: 0)
    backgroundWasLight = Date().asColor().isLight
    textColor = Date().asColor().appropriateBlackOrWhite()
  }

  func update() {
    let date = Date()
    let dateColor = date.asColor()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    let dateString = formatter.string(from: date)
    stringValue = dateString

    if dateColor.isLight != backgroundWasLight  {
      let blackOrWhite = dateColor.appropriateBlackOrWhite()
      fade(to: blackOrWhite.withAlphaComponent(preventBurnInAlpha))
    }
    backgroundWasLight = dateColor.isLight
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.1
    font = NSFont(name: Fonts.timeFont, size: newFontSize)
  }
}
