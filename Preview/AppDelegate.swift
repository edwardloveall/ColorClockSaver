import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var window: NSWindow!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    guard let screen = NSScreen.main() else { return }
    window.setFrame(screen.frame, display: true)
    if let screenSaverView = window.contentView as? MainView {
      let timer = Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval,
                                       target: screenSaverView,
                                       selector: #selector(screenSaverView.animateOneFrame),
                                       userInfo: nil,
                                       repeats: true)
      timer.fire()
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {}
}
