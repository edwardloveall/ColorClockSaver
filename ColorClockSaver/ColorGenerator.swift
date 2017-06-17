import Cocoa

class ColorGenerator {
  func rgbComponentsFromTime() -> (red: Double, green: Double, blue: Double) {
    let calendar = Calendar(identifier: .gregorian)
    let date = Date()
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)

    let hexHour = (1.0/23) * Double(hour)
    let hexMinute = (1.0/59) * Double(minute)
    let hexSecond = (1.0/59) * Double(second)

    return (
      red: hexHour,
      green: hexMinute,
      blue: hexSecond
    )
  }

  func hexColorFromTime() -> String {
    let rgbValues = rgbComponentsFromTime()
    let scaledRed = Int(rgbValues.red * 255)
    let scaledGreen = Int(rgbValues.green * 255)
    let scaledBlue = Int(rgbValues.blue * 255)

    let hexRed = String(format: "%02x", scaledRed)
    let hexGreen = String(format: "%02x", scaledGreen)
    let hexBlue = String(format: "%02x", scaledBlue)

    return "\(hexRed)\(hexGreen)\(hexBlue)".uppercased()
  }
}
