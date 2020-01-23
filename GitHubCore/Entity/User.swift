// MARK: - User
public struct User: Codable {
   public let name: String?
   public let avatarURL: URL
   public let bio: String?
   public let company: String?

    enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatarUrl"
        case bio, company
    }
}
