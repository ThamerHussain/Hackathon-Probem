import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    
    let windowFrame = NSRect(x: 0, y: 0, width: 1400, height: 900)
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    
    self.minSize = NSSize(width: 1000, height: 700)
    
    self.center()
    
    self.title = "Neural Scanner - Biometric Identification System"
    
    self.styleMask = [.titled, .closable, .miniaturizable, .resizable]

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
