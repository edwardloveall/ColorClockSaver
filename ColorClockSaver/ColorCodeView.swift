import Cocoa

class ColorCodeView: NSTextField {
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
    let calendar = Calendar(identifier: .gregorian)
    let date = Date()
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)

    let hexHour = (255.0/23) * Double(hour)
    let hexMinute = (255.0/59) * Double(minute)
    let hexSecond = (255.0/59) * Double(second)

    let hexHourString = String(format: "%02x", Int(hexHour)).uppercased()
    let hexMinuteString = String(format: "%02x", Int(hexMinute)).uppercased()
    let hexSecondString = String(format: "%02x", Int(hexSecond)).uppercased()

    return "\(hexHourString)\(hexMinuteString)\(hexSecondString)"
  }
}
