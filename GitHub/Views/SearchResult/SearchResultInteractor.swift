import RxSwift
import RxCocoa
import GitHubCore

protocol SearchResultInteractorProtocol {
    func getSearchUser(query: String) -> Single<[Node<User>]>
}

final class SearchResultInteractor: SearchResultInteractorProtocol {
    func getSearchUser(query: String) -> Single<[Node<User>]> {
        return UserSearchProvider().getUserSearch(query: query)
    }
}
