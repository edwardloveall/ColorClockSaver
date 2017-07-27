import Cocoa

class ConfigureSheetController: NSWindowController {
  @IBOutlet weak var twelveHourCheck: NSButton!
  let settings = Settings()

  override var windowNibName: String? {
    return "ConfigureSheet"
  }

  override func windowDidLoad() {
    twelveHourCheck.state = settings.twelveHourStateForCheckBox()
  }

  @IBAction func done(sender: NSButton) {
    guard
      let window = window,
      let sheetParent = window.sheetParent
    else {
      fatalError("Could not get configure sheet parent")
    }
    sheetParent.endSheet(window)
  }

  @IBAction func setTwelveHour(sender: NSButton) {
    let value = sender.state
    if value == NSOnState {
      settings.isTwelveHour = true
    } else {
      settings.isTwelveHour = false
    }
  }
}
