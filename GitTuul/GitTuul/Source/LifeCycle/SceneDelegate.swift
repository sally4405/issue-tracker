import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let networkManager = NetworkManager.shared

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        let code = URLContexts.first?.url.absoluteString.components(separatedBy: "code=").last ?? ""
        let endPoint = GithubEndPoint.accessToken(clientID: ClientInformation.clientID, clientSecret: ClientInformation.clientSecret, code: code)
        _ = networkManager
            .request(endPoint: endPoint)
            .subscribe(
                onNext: { data in
                    self.window?.rootViewController = GitTuulTabBarController(data: data)
                }, onError: { error in
                    // MARK: - TODO 에러처리
                    print(error)
                })
    }
}
