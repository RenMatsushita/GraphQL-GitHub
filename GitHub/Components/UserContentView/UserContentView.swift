import UIKit
import GitHubCore
import ImagePipeline

final class UserContentView: UIView, BackingViewMaker, ReusableViewType {
    
    typealias View = UserContentView
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var companyLabel: UILabel!
    
    static func makeBackedView() -> UserContentView {
        return UserContentView.loadFromNib()
    }
    func update(for user: User) {
        nameLabel.text = user.name
        bioLabel.text = user.bio
        companyLabel.text = user.company
        
        let resizer = ImageResizer(targetSize: .init(width: 56, height: 56), contentMode: .aspectFill)
        ImagePipeline.shared.load(user.avatarURL,
                                  into: avatarImageView,
                                  transition: .fadeIn,
                                  processors: [resizer])
    }
    func prepareForReuse() {
        nameLabel.text = nil
        bioLabel.text = nil
        companyLabel.text = nil
        avatarImageView.image = nil
    }
}
