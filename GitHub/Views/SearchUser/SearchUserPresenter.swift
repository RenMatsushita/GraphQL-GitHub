import RxSwift
import RxCocoa

protocol SearchUserViewProtocol {
    
}

final class SearchUserPresenter {
    private(set) var items: Driver<[String]> = .empty()
    init(view: SearchUserViewProtocol, interactor: SearchUserInteractorProtocol) {
        
        self.items = Observable
            .just(())
            .map({ _ -> [String] in
                return ["Twitter", "Facebook", "Instagram", "Snapchat"]
            })
            .asDriver(onErrorJustReturn: [])
    }
}
