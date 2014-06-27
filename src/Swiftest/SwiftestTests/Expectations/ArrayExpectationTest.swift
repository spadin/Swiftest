import Swiftest
import XCTest

class ArrayExpectationTest : XCTestCase {

  func test_Collection() {
    let expect = ArrayExpectation(subject : [1, 2])
    expect.toEqual([1, 2])

    XCTAssertEqual(expect.status, ExampleStatus.Pass)
  }

  func test_toEqual_Fail() {
    let expect = ArrayExpectation(subject : [1, 2])
    expect.toEqual([1, 2, 3])

    XCTAssertEqual(expect.status, ExampleStatus.Fail)
  }

  func test_toContain() {
    let expect = ArrayExpectation(subject: [1, 2])

    expect.toContain(1)
    XCTAssertEqual(expect.status, ExampleStatus.Pass)
  }

  func test_toContain_Fail() {
    let expect = ArrayExpectation(subject : [1, 2])

    expect.toContain(3)
    XCTAssertEqual(expect.status, ExampleStatus.Fail)
  }

  func test_not_toContain_Pass() {
    let expect = ArrayExpectation(subject : [1, 2])

    expect.not().toContain(3)
    XCTAssertEqual(expect.status, ExampleStatus.Pass)
  }

  func test_not_toContain_Fail() {
    let expect = ArrayExpectation(subject : [1, 2])

    expect.not().toContain(2)
    XCTAssertEqual(expect.status, ExampleStatus.Fail)
  }
}