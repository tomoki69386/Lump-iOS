import Foundation

public protocol Cache {
    associatedtype Element: AnyObject
    func store(_ element: Element, for key: String)
    func load(for key: String) -> Element?
    func remove(for key: String)
    func removeAll()
}
