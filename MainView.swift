import ScreenSaver

class MainView: ScreenSaverView {
  let wrapperView = NSStackView()
  let timeView = TimeView()

  override func viewDidMoveToWindow() {
    layoutViews()
    timeView.resizeFont(for: bounds.size)
  }

  func layoutViews() {
    wrapperView.frame = frame
    wrapperView.alignment = .centerX
    wrapperView.orientation = .vertical
    wrapperView.distribution = .equalCentering
    wrapperView.addArrangedSubview(timeView)
    addSubview(wrapperView)

    wrapperView.translatesAutoresizingMaskIntoConstraints = false

    wrapperView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    wrapperView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    wrapperView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
  }

  override func draw(_ rect: NSRect) {
    timeView.update()
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
  }
}
