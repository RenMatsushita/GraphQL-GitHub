struct QueryUserSearchRequest: QueryRequestProtocol {
    typealias Decoded = User
    var username: String
    var query: String {
        return """
        query {
          search(query: "\(username)", type: USER, first: 100) {
            edges {
              node {
                ... on User {
                  name
                  avatarUrl
                  bio
                  company
                }
              }
            }
          }
        }
        """
    }
}
