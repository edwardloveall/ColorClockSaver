import Cocoa

class LabelView: NSTextField {
  var frameCount: CGFloat = 1
  var startColor = NSColor.black
  var endColor = NSColor.black
  var backgroundWasLight = false

  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  func setup() {}

  func fade(to toColor: NSColor) {
    guard let textColor = textColor else { return }
    frameCount = 1
    startColor = textColor
    endColor = toColor

    Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true, block: step)
  }

  func step(_ timer: Timer) {
    let fraction: CGFloat = frameCount / CGFloat(20)

    if fraction >= 1 {
      timer.invalidate()
      return
    }

    textColor = startColor.blended(withFraction: fraction, of: endColor)
    frameCount += 1
  }
}
