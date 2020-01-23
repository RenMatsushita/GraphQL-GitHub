import RxSwift
import RxCocoa

// MARK: - UserSearchProvider
public final class UserSearchProvider {
    public init() { }
    public func getUserSearch(query username: String) -> Single<[Node<User>]> {
        let request = QueryUserSearchRequest(username: username)
        return APIClient().request(request)
            .map({ response -> [Node<User>] in
                print(String(data: response.data, encoding: .utf8)!)
                do {
                    let decoded = try JSONDecoder().decode(GraphData<Search<Edges<Node<User>>>>.self, from: response.data)
                    return decoded.data.search.edges
                } catch {
                    throw error
                }
            })
    }
}
