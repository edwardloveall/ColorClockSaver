import Cocoa

class ColorGenerator {
  func rgbComponentsFromTime() -> (red: Int, green: Int, blue: Int) {
    let calendar = Calendar(identifier: .gregorian)
    let date = Date()
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)

    let hexHour = (255.0/23) * Double(hour)
    let hexMinute = (255.0/59) * Double(minute)
    let hexSecond = (255.0/59) * Double(second)

    return (
      red: Int(hexHour),
      green: Int(hexMinute),
      blue: Int(hexSecond)
    )
  }
}
