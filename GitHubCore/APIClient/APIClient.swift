import RxSwift
import RxCocoa

protocol APIClientProtocol {
    func request<QueryRequest: QueryRequestProtocol>(_ queryRequest: QueryRequest) -> Single<Response>
}

final class APIClient: APIClientProtocol {
    public init() { }
    func request<QueryRequest>(_ queryRequest: QueryRequest) -> Single<Response> where QueryRequest: QueryRequestProtocol {
        return Single<Response>.create(subscribe: { single in
            var urlRequest = URLRequest(url: URL(string: "https://api.github.com/graphql")!)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json",
                                              "Authorization": "token \(GitHub.shared.token)"]
            let parameter: [String: Any] = ["query": queryRequest.query]
            urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                switch ((response as? HTTPURLResponse), data, error) {
                case let (.some(response), data, _):
                    let response = Response(urlRequest, response: response, data: data)
                    single(.success(response))
                default:
                    single(.error(error!))
                }
            }
            task.resume()
            return Disposables.create(with: task.cancel)
        })
    }
}
