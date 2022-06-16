import UIKit

enum ViewControllerFactory {
    case login
    case tab
    case issue

    func make() -> UIViewController {
        switch self {
        case .login:
            return LoginViewController(viewModel: LoginViewModel())
        case .tab:
            return GitTuulTabBarController()
        case .issue:
            return IssueViewController(viewModel: IssueViewModel())
        }
    }
}
