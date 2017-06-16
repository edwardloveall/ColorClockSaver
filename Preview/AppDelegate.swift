import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  @IBOutlet weak var window: NSWindow!

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    guard let screenSaverView = window.contentView as? MainView
      else { fatalError("could not cast window's contentView as a MainView") }
    guard let screen = NSScreen.main()
      else { fatalError("could not retrive main screen") }

    window.setFrame(screen.frame, display: true)
    window.delegate = screenSaverView
    let timer = Timer.scheduledTimer(timeInterval: screenSaverView.animationTimeInterval,
                                     target: screenSaverView,
                                     selector: #selector(screenSaverView.animateOneFrame),
                                     userInfo: nil,
                                     repeats: true)
    timer.fire()
  }

  func applicationWillTerminate(_ aNotification: Notification) {}
}
