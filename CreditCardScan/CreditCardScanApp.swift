//
//  CreditCardScanApp.swift
//  CreditCardScan
//
//  Created by Jay Eskandarian on 7/28/21.
//

import SwiftUI
import CardScan

@main
struct CreditCardScanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        ScanViewController.configure(apiKey: "H-cXLIgTtYcvTr3pMVT1WZaF9eU9tI7L")
        return true
    }
}
