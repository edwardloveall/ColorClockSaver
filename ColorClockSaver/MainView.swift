import ScreenSaver

class MainView: ScreenSaverView {
  let backgroundView = BackgroundView()
  let wrapperView = NSStackView()
  let timeView = TimeView()
  let colorCodeView = ColorCodeView()

  override func viewDidMoveToWindow() {
    wantsLayer = true
    animationTimeInterval = 1

    loadFonts()
    configureViews()
    layoutViews()

    animateOneFrame()
  }

  func loadFonts() {
    Fonts.load(fontName: Fonts.timeFont, extension: "ttf")
  }

  func configureViews() {
    wrapperView.alignment = .centerX
    wrapperView.orientation = .vertical
    wrapperView.distribution = .equalCentering
    wrapperView.addArrangedSubview(timeView)
    wrapperView.addArrangedSubview(colorCodeView)
    addSubview(backgroundView)
    addSubview(wrapperView)
  }

  func layoutViews() {
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    wrapperView.translatesAutoresizingMaskIntoConstraints = false

    backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    backgroundView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    backgroundView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true

    wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    wrapperView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    wrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    timeView.resizeFont(for: bounds.size)
    colorCodeView.resizeFont(for: bounds.size)
  }

  override func draw(_ rect: NSRect) {}

  override func animateOneFrame() {
    backgroundView.update()
    timeView.update()
    colorCodeView.update()
    setNeedsDisplay(bounds)
  }
}
