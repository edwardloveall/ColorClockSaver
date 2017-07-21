import Cocoa

struct Settings {
  static func register() {
    let defaults: [String: Any] = [
      "isTwelveHour": false
    ]
    UserDefaults.standard.register(defaults: defaults)
  }

  func dateFormat() -> String {
    if UserDefaults.standard.bool(forKey: "isTwelveHour") {
      return "h:mm:ss"
    } else {
      return "HH:mm:ss"
    }
  }
}
