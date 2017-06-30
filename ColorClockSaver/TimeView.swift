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
    wantsLayer = true
  }

  func update() {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss"
    let dateString = formatter.string(from: date)

    guard let layer = self.layer else {
      fatalError("Could not find CALayer on TimeView")
    }

    NSAnimationContext.runAnimationGroup({ (context: NSAnimationContext) -> Void in
      self.stringValue = dateString
    }, completionHandler: { () -> Void in
      let fade = CATransition()
      fade.duration = 0.3
      layer.add(fade, forKey: nil)
      self.textColor = date.asColor().appropriateBlackOrWhite()
    })
  }

  func resizeFont(for size: NSSize) {
    let newFontSize = size.width * 0.1
    font = NSFont(name: Fonts.timeFont, size: newFontSize)
  }
}
