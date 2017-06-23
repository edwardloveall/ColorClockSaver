import ScreenSaver

class MainView: ScreenSaverView {
  let wrapperView = NSStackView()
  let timeView = TimeView()
  let colorCodeView = ColorCodeView()

  override func viewDidMoveToWindow() {
    wantsLayer = true
    if let layer = layer {
      let date = Date()
      layer.backgroundColor = date.asColor().cgColor
    }
    animationTimeInterval = 1
    Fonts.load(fontName: Fonts.timeFont, extension: "ttf")
    layoutViews()
    timeView.resizeFont(for: bounds.size)
    colorCodeView.resizeFont(for: bounds.size)
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

  override func draw(_ rect: NSRect) {}

  override func animateOneFrame() {
    let date = Date()
    let newColor = date.asColor().cgColor

    if let layer = layer {
      let fade = CATransition()
      fade.duration = 0.1
      layer.add(fade, forKey: "transition")
      layer.backgroundColor = newColor
    }
    timeView.update()
    colorCodeView.update()
    setNeedsDisplay(bounds)
  }
}
