import ScreenSaver

class MainView: ScreenSaverView {
  let wrapperView = NSStackView()
  let timeView = TimeView()
  let colorCodeView = ColorCodeView()
  var currentBackground = Date().asColor().cgColor

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

  override func animateOneFrame() {
    let date = Date()
    let newColor = date.asColor().cgColor
    let animation = CABasicAnimation(keyPath: "backgroundColor")
    animation.fromValue = currentBackground
    animation.toValue = newColor
    animation.duration = 1

    if let layer = layer {
      layer.add(animation, forKey: "backgroundColor")
      currentBackground = newColor
    }
    timeView.update()
    colorCodeView.update()
    setNeedsDisplay(bounds)
  }
}
