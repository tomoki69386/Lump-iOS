import SnapshotTesting
import XCTest
import Component
import SwiftUI

class SearchTextFieldTests: XCTestCase {
  override class func setUp() {
    super.setUp()
    SnapshotTesting.diffTool = "ksdiff"
  }
  
  func testSearchTextField() {
    assertSnapshot(
      matching: SearchTextField()
        .padding(.all, 20)
        .frame(width: 375)
        .previewLayout(.sizeThatFits),
      as: .image
    )
  }
}
