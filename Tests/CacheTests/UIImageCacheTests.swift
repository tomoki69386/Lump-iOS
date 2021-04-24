import XCTest
@testable import Cache

class UIImageCacheTests: XCTestCase {
    func testImageCache() {
        let cache = UIImageCache()
        
        let image1 = UIImage(systemName: "pencil")!
        let image2 = UIImage(systemName: "trash")!
        
        cache.store(image1, for: "image1")
        
        XCTAssertEqual(cache.load(for: "image1"), image1)
        XCTAssertNotEqual(cache.load(for: "image1"), image2)
        XCTAssertNil(cache.load(for: "image2"))
        
        cache.store(image2, for: "image2")
        
        XCTAssertEqual(cache.load(for: "image1"), image1)
        XCTAssertEqual(cache.load(for: "image2"), image2)
        XCTAssertNotEqual(cache.load(for: "image1"), image2)
        XCTAssertNotEqual(cache.load(for: "image2"), image1)
        
        cache.remove(for: "image1")
        
        XCTAssertNil(cache.load(for: "image1"))
        XCTAssertEqual(cache.load(for: "image2"), image2)
        XCTAssertNotEqual(cache.load(for: "image2"), image1)
        
        cache.removeAll()
        XCTAssertNil(cache.load(for: "image1"))
        XCTAssertNil(cache.load(for: "image2"))
    }
}
