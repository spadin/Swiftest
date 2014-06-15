import Swiftest
import XCTest

class ConsoleListenerTest : XCTestCase {
  
  let listener = Swiftest.ConsoleListener()
  var messages : String[] = []
  
  override func setUp() {
    listener.printer = { (let msg) in self.messages.append(msg) }
  }
  
}