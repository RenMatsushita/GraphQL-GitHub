public struct GraphData<Element: Codable>: Codable {
    public let data: Element
}
public struct Search<Element: Codable>: Codable {
    public let search: Element
}
public struct Edges<Element: Codable>: Codable {
    public let edges: [Element]
}
public struct Node<Element: Codable>: Codable {
    public let node: Element
}
