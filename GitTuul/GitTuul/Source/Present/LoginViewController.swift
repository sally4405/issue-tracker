import UIKit
import SnapKit

final class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Git-Tuul 🪶"
        label.font = .Baemin.kirangHaerang
        label.tintColor = .GreyScale.black
        label.textAlignment = .center
        label.sizeToFit()

        return label
    }()

    private let idView: IdView = {
        let view = IdView()
        view.backgroundColor = .Custom.backgrounds1

        return view
    }()

    private let logInButton = UIButton.plainAttributedButton("로그인")

    private let signInButton = UIButton.plainAttributedButton("회원가입")

    private let gitHubLoginButton: UIButton = {
        let image = UIImage(named: "GitHubMark.png")
        let button = UIButton.filledAttributedButton("GitHub 계정으로 로그인", image)
        let action = UIAction { _ in
            let networkManager = NetworkManager.shared,
                endPoint = GithubEndPoint.oauth(clientID: networkManager.clientID, scope: [.repo, .user])
            networkManager.requestCode(endPoint: endPoint)
        }
        button.addAction(action, for: .touchUpInside)

        return button
    }()

    private let appleLoginButton: UIButton = {
        let image = UIImage(systemName: "applelogo")
        let button = UIButton.filledAttributedButton("Apple 계정으로 로그인", image)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .Custom.backgrounds2

        layoutIdView()
        layoutTitleLabel()
        layoutLoginButton()
        layoutSignInButton()
        layoutAppleLoginButton()
        layoutGitHubLoginButton()

    }

}

private extension LoginViewController {

    func layoutIdView() {
        self.view.addSubview(idView)

        idView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    func layoutTitleLabel() {
        self.view.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(idView.snp.top).offset(-titleLabel.frame.height)
        }
    }

    func layoutLoginButton() {
        self.view.addSubview(logInButton)

        logInButton.snp.makeConstraints { make in
            make.top.equalTo(idView.snp.bottom).offset(16)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
    }

    func layoutSignInButton() {
        self.view.addSubview(signInButton)

        signInButton.snp.makeConstraints { make in
            make.top.equalTo(idView.snp.bottom).offset(16)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }
    }

    func layoutAppleLoginButton() {
        self.view.addSubview(appleLoginButton)

        appleLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(14)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    func layoutGitHubLoginButton() {
        self.view.addSubview(gitHubLoginButton)

        gitHubLoginButton.snp.makeConstraints { make in
            make.bottom.equalTo(appleLoginButton.snp.top).offset(-14)
            make.centerX.equalToSuperview()
            make.height.equalTo(appleLoginButton.snp.height)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

}
