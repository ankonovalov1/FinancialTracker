import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    var routerFactory: RouterFactoryProtocol?
    let notificationCenter = UNUserNotificationCenter.current()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        navigationController = UINavigationController()
        routerFactory = RouterFactory()
        
        guard
            let scene = scene as? UIWindowScene,
            let navigationController = navigationController,
            let routerFactory = routerFactory
        else { return }
        
        let vc = prepareViewControllerForLaunch(routerFactory)
        navigationController.isNavigationBarHidden = true
        navigationController.setViewControllers([vc], animated: false)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        requestNotificationPermission()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    private func prepareViewControllerForLaunch(_ factory: RouterFactoryProtocol) -> UIViewController {
        let router = factory.createRouter(for: .splash)
        return router.configure()
    }

    private func requestNotificationPermission() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { granted, error in
            if granted {
                print("Is user agreed = \(granted)")
                self.getNotificationSettings()
            }
        })
    }
    
    private func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print(settings)
        }
    }

}

