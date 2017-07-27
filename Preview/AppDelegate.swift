import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet var window: NSWindow!
  let configureSheet = ConfigureSheet.sharedInstance

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    setDefaults()
    guard let screenSaverView = window.contentView as? MainView
      else { fatalError("could not cast window's contentView as a MainView") }
    guard let screen = NSScreen.main()
      else { fatalError("could not retrive main screen") }

    window.setFrame(screen.frame, display: true)
    window.delegate = self
    let timer = Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval,
                                     target: screenSaverView,
                                     selector: #selector(screenSaverView.animateOneFrame),
                                     userInfo: nil,
                                     repeats: true)
    timer.fire()

    screenSaverView.timeView.resizeFont(for: screenSaverView.bounds.size)
    screenSaverView.colorCodeView.resizeFont(for: screenSaverView.bounds.size)
  }

  func applicationWillTerminate(_ aNotification: Notification) {}

  @IBAction func openConfigureSheet(sender: NSMenuItem) {
    window.beginSheet(configureSheet.window, completionHandler: nil)
  }

  func setDefaults() {
    let args = CommandLine.arguments
    let defaults = Settings()
    if let index = args.index(of: "-isTwelveHour") {
      let value = args[index + 1] == "YES" ? true : false
      defaults.isTwelveHour = value
    }
  }
}

extension AppDelegate: NSWindowDelegate {
  func windowDidResize(_ notification: Notification) {
    guard let screenSaverView = window.contentView as? MainView
      else { fatalError("could not cast window's contentView as a MainView") }
    screenSaverView.timeView.resizeFont(for: screenSaverView.bounds.size)
    screenSaverView.colorCodeView.resizeFont(for: screenSaverView.bounds.size)
  }
}
