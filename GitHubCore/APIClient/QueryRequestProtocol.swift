import Foundation

protocol QueryRequestProtocol {
    associatedtype Decoded: Codable
    var query: String { get }
}
