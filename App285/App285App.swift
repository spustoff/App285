//
//  App285App.swift
//  App285
//
//  Created by IGOR on 15/12/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Apphud.start(apiKey: "app_vGqWpZToVaQuq3ypSZHaTodPDzqJfT")
        
        OneSignal.initialize("d15f028a-1bcc-4cf2-83f3-8e50030ec1ba", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("b40be7d7a2506ed85e5b5ec599f8f91a")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func decodeBase64(_ base64String: String) -> String {
    
    guard let data = Data(base64Encoded: base64String) else { return base64String }
    
    guard let decodedResult = String(data: data, encoding: .utf8) else { return base64String }
    
    return decodedResult
}

@main
struct App285App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {

                ContentView()
            })
        }
    }
}
