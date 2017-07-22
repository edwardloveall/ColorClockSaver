import ScreenSaver

class Settings {
  let defaults = Settings.screenSaverDefaults()

  func register() {
    let values: [String: Any] = [
      "isTwelveHour": false
    ]
    defaults.register(defaults: values)
  }

  func dateFormat() -> String {
    if defaults.bool(forKey: "isTwelveHour") {
      return "h:mm:ss"
    } else {
      return "HH:mm:ss"
    }
  }

  private static func screenSaverDefaults() -> ScreenSaverDefaults {
    guard let bundleId = Bundle(for: Settings.self).bundleIdentifier else {
      fatalError("Could not find a bundle identifier")
    }

    guard let defaults = ScreenSaverDefaults(forModuleWithName: bundleId) else {
      fatalError("Could not create ScreenSaverDefaults instance")
    }

    return defaults
  }
}
