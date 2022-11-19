import ScreenSaver

class Settings {
  let defaults = Settings.screenSaverDefaults()
  var isTwelveHour: Bool {
    get {
      return defaults.bool(forKey: "isTwelveHour")
    }
    set(value) {
      defaults.set(value, forKey: "isTwelveHour")
      defaults.synchronize()
    }
  }

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

  func twelveHourStateForCheckBox() -> NSControl.StateValue {
    if isTwelveHour {
      return NSControl.StateValue.on
    } else {
      return NSControl.StateValue.off
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
