import ScreenSaver

class Settings {
  func register() {
    let values: [String: Any] = [
      "isTwelveHour": false
    ]
    screenSaverDefaults().register(defaults: values)
  }

  func dateFormat() -> String {
    if screenSaverDefaults().bool(forKey: "isTwelveHour") {
      return "h:mm:ss"
    } else {
      return "HH:mm:ss"
    }
  }

  private func screenSaverDefaults() -> ScreenSaverDefaults {
    guard let bundleId = Bundle(for: Settings.self).bundleIdentifier else {
      fatalError("Could not find a bundle identifier")
    }

    guard let defaults = ScreenSaverDefaults(forModuleWithName: bundleId) else {
      fatalError("Could not create ScreenSaverDefaults instance")
    }

    return defaults
  }
}
