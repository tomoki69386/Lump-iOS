import UIKit

public class UIImageCache: Cache {
    public typealias Element = UIImage
    
    public static let shared = UIImageCache()
    let cache: NSCache<AnyObject, Element>
    init() {
        cache = .init()
    }
    
    public func store(_ element: Element, for key: String) {
        print("\(#function): \(key)")
        cache.setObject(element, forKey: key as AnyObject)
    }
    
    public func load(for key: String) -> Element? {
        print("\(#function): \(key)")
        return cache.object(forKey: key as AnyObject)
    }
    
    public func remove(for key: String) {
        cache.removeObject(forKey: key as AnyObject)
    }
    
    public func removeAll() {
        cache.removeAllObjects()
    }
}
