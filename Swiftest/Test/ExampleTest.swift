import Swiftest
import XCTest

class ExampleTest : XCTestCase {
  var example = Swiftest.Example(subject : "the-description", fn:Swiftest.nullFn)
  
  func test_init() {
    XCTAssertEqual(example.subject, "the-description")
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Pending)
  }
  
  func test_expect() {
    let expectation = example.expect("a")
    XCTAssertEqual(expectation.subject[0]!, "a")
  }
  
  func test_run() {
    let example = Swiftest.Example(subject: "what", fn: {
      expect(1).toEqual(1)
    })
  
    example.run()
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Pass)
  }
  
  func test_run_fail() {
    let example = Swiftest.Example(subject: "what", fn: {
      expect(1).toEqual(1)
      expect(1).toEqual(2)
    })
    
    example.run()
    
    XCTAssertEqual(example.expectations[0].status, Swiftest.ExampleStatus.Pass)
    XCTAssertEqual(example.expectations[1].status, Swiftest.ExampleStatus.Fail)
    
    XCTAssertEqual(example.getStatus(), Swiftest.ExampleStatus.Fail)
  }
}
