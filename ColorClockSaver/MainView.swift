import ScreenSaver

class MainView: ScreenSaverView {
  let wrapperView = NSStackView()
  let timeView = TimeView()
  let colorCodeView = ColorCodeView()
  let colorGenerator = ColorGenerator()

  override func viewDidMoveToWindow() {
    layoutViews()
    timeView.resizeFont(for: bounds.size)
    colorCodeView.resizeFont(for: bounds.size)
    Fonts.load(fontName: Fonts.timeFont, extension: "ttf")
  }

  func layoutViews() {
    wrapperView.frame = frame
    wrapperView.alignment = .centerX
    wrapperView.orientation = .vertical
    wrapperView.distribution = .equalCentering
    wrapperView.addArrangedSubview(timeView)
    wrapperView.addArrangedSubview(colorCodeView)
    addSubview(wrapperView)

    wrapperView.translatesAutoresizingMaskIntoConstraints = false

    wrapperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    wrapperView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    wrapperView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }

  override func draw(_ rect: NSRect) {
    let startingColor = colorGenerator.colorFromTime()
    let endingColor = colorGenerator.darkenedColorFromTime()
    if let gradient = NSGradient(starting: startingColor, ending: endingColor) {
      gradient.draw(in: rect, relativeCenterPosition: NSPoint.zero)
    }
    timeView.update()
    colorCodeView.update()
  }

  override func animateOneFrame() {
    setNeedsDisplay(bounds)
  }
}
