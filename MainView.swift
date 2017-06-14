import ScreenSaver

class MainView: ScreenSaverView {
  override func draw(_ rect: NSRect) {
    NSColor.red.setFill()
    NSBezierPath.fill(rect)
  }
}
