//
//  AppDelegate.swift
//  Todoye
//
//  Created by Eetu Hernesniemi on 29.3.2022.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            let realm = try Realm()
        } catch {
            print("Error initialising new realm, \(error)")
        }
        return true
    }
}

