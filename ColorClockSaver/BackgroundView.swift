import Cocoa

class BackgroundView: NSView {
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  func setup() {
    if let layer = layer {
      let date = Date()
      layer.backgroundColor = date.asColor().cgColor
    }
  }

  func update() {
    let date = Date()
    let newColor = date.asColor().cgColor
    if let layer = layer {
      let fade = CATransition()
      fade.duration = 0.3
      layer.add(fade, forKey: "transition")
      layer.backgroundColor = newColor
    }
  }
}
