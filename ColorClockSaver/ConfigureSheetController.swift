import Cocoa

class ConfigureSheetController: NSWindowController {
  override var windowNibName: String? {
    return "ConfigureSheet"
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
}
