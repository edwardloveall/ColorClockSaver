import Cocoa

extension Date {
  private func asRGBComonents() -> (red: Double, green: Double, blue: Double) {
    let calendar = Calendar(identifier: .gregorian)
    let hour = calendar.component(.hour, from: self)
    let minute = calendar.component(.minute, from: self)
    let second = calendar.component(.second, from: self)

    let hexHour = (1.0/23) * Double(hour)
    let hexMinute = (1.0/59) * Double(minute)
    let hexSecond = (1.0/59) * Double(second)

    return (
      red: hexHour,
      green: hexMinute,
      blue: hexSecond
    )
  }

  func asHexColorString() -> String {
    let rgbValues = asRGBComonents()
    let scaledRed = Int(rgbValues.red * 255)
    let scaledGreen = Int(rgbValues.green * 255)
    let scaledBlue = Int(rgbValues.blue * 255)

    let hexRed = String(format: "%02x", scaledRed)
    let hexGreen = String(format: "%02x", scaledGreen)
    let hexBlue = String(format: "%02x", scaledBlue)

    return "\(hexRed)\(hexGreen)\(hexBlue)".uppercased()
  }

  func asColor() -> NSColor {
    let components = asRGBComonents()
    let color = NSColor(
      calibratedRed: CGFloat(components.red),
      green: CGFloat(components.green),
      blue: CGFloat(components.blue),
      alpha: 1
    )

    return color
  }

  func asDarkenedColor() -> NSColor {
    let startColor = asColor()
    guard let endColor = startColor.blended(withFraction: 0.12, of: .black)
      else { fatalError("could not crate darker gradient color") }

    return endColor
  }
}
