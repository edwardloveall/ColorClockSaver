import Cocoa

class ConfigureSheet {
  static var sharedInstance = ConfigureSheet()

  @IBOutlet var window: NSWindow!
  @IBOutlet weak var twelveHourCheck: NSButton!
  let settings = Settings()

  init() {
    let bundle = Bundle(for: ConfigureSheet.self)
    bundle.loadNibNamed(NSNib.Name(rawValue: "ConfigureSheet"), owner: self, topLevelObjects: nil)
    twelveHourCheck.state = settings.twelveHourStateForCheckBox()
  }

  @IBAction func done(_ sender: NSButton) {
    guard let parent = window.sheetParent else {
      fatalError("Can't get configure sheet parent window")
    }
    parent.endSheet(window)
  }

  @IBAction func setTwelveHour(_ sender: NSButton) {
    let value = sender.state
    if value == NSControl.StateValue.on {
      settings.isTwelveHour = true
    } else {
      settings.isTwelveHour = false
    }
  }
}
