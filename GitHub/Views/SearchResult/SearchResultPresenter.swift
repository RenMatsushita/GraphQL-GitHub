import RxSwift
import RxCocoa
import GitHubCore

protocol SearchResultViewProtocol {
    var query: Observable<String> { get }
}

final class SearchResultPresenter {
    
    private(set) var items: Driver<[Node<User>]> = .empty()
    
    init(view: SearchResultViewProtocol, interactor: SearchResultInteractorProtocol) {
        
        self.items = view
            .query
            .flatMap({ query -> Single<[Node<User>]> in
                return interactor.getSearchUser(query: query)
            })
            .catchError({ error in
                print(#line, error)
                return .error(error)
            })
            .asDriver(onErrorJustReturn: [])
    }
}
