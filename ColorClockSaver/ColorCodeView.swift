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
    font = NSFont(name: "mononoki", size: 0)
  }

  func update() {
    stringValue = convertTimeToHex()
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.0212
    font = NSFont(name: "mononoki", size: newFontSize)
  }

  func convertTimeToHex() -> String {
    let rgbValues = colorGen.rgbComponentsFromTime()
    let hexHourString = String(format: "%02x", rgbValues.red).uppercased()
    let hexMinuteString = String(format: "%02x", rgbValues.green).uppercased()
    let hexSecondString = String(format: "%02x", rgbValues.blue).uppercased()

    return "\(hexHourString)\(hexMinuteString)\(hexSecondString)"
  }
}
