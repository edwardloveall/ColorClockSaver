import ScreenSaver

class MainView: ScreenSaverView {
  let wrapperView: NSStackView
  let timeView: TimeView

  override init?(frame: NSRect, isPreview: Bool) {
    wrapperView = NSStackView()
    timeView = TimeView()
    super.init(frame: frame, isPreview: isPreview)
    setup()
  }
  
  required init?(coder: NSCoder) {
    wrapperView = NSStackView()
    timeView = TimeView()
    super.init(coder: coder)
    setup()
  }

  func setup() {
    guard let screen = NSScreen.main() else { return }
    wrapperView.alignment = .centerX
    wrapperView.orientation = .vertical
    wrapperView.distribution = .equalCentering
    wrapperView.frame = screen.frame
    wrapperView.addArrangedSubview(timeView)

    addSubview(wrapperView)
    translatesAutoresizingMaskIntoConstraints = false
  }

  override func draw(_ rect: NSRect) {
    timeView.setNeedsDisplay(rect)
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
  }
}
