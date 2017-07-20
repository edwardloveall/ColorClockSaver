import Cocoa

struct Settings {
  static func dateFormat() -> String {
    if UserDefaults.standard.bool(forKey: "isTwelveHour") {
      return "h:mm:ss"
    } else {
      return "HH:mm:ss"
    }
  }
}
