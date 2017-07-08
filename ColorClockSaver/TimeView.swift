import Cocoa

class TimeView: NSTextField {
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
    font = NSFont(name: Fonts.timeFont, size: 0)
  }

  func update() {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    let dateString = formatter.string(from: date)
    stringValue = dateString

    fade(to: date.asColor().appropriateBlackOrWhite())
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.1
    font = NSFont(name: Fonts.timeFont, size: newFontSize)
  }

  func fade(to toColor: NSColor) {
    guard let textColor = textColor else { return }
    var stepCount: CGFloat = 1
    let fromColor = textColor

    Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { (timer) in
      let fraction = stepCount / CGFloat(20)

      if fraction >= 1 {
        timer.invalidate()
      }
      self.textColor = fromColor.blended(withFraction: CGFloat(fraction),
                                         of: toColor)
      stepCount += 1
    }
  }
}

