import XCTest
@testable import GitHubCore

class GitHubCoreTests: XCTestCase {
    func testDecoded() {
        let data = """
        {
          "data": {
            "search": {
              "edges": [
                {
                  "node": {
                    "name": "ともき",
                    "avatarUrl": "https://avatars0.githubusercontent.com/u/28350464?v=4",
                    "bio": "iOS App Developer"
                  }
                }
              ]
            }
          }
        }
        """.data(using: .utf8)!

        do {
            let decoded = try JSONDecoder().decode(GraphData<Search<Edges<Node<User>>>>.self, from: data)
            print(decoded)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
