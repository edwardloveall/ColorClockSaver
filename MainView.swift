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

  override func viewDidMoveToWindow() {
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

  func setup() {
  }

  override func draw(_ rect: NSRect) {
    timeView.update()
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
  }
}
