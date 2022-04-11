//
//  DengageCoordinator.swift
//  dengage_flutter
//
//  Created by Kamran Younis on 22/04/2021.
//

import Foundation
import Flutter
import Dengage

@objc(DengageCoordinator)
public class DengageCoordinator: NSObject {
    @objc public static let staticInstance: DengageCoordinator = DengageCoordinator()

    // todo: will remove in case not used.
    @objc var integerationKey: String?
    @objc var launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    @objc(setupDengage:launchOptions:)
    public func setupDengage(key:NSString, launchOptions:NSDictionary?) {
        Dengage.setIntegrationKey(key: key as String)
        if (launchOptions != nil) {
            Dengage.initWithLaunchOptions(withLaunchOptions: launchOptions as! [UIApplication.LaunchOptionsKey : Any])
        } else {
            Dengage.initWithLaunchOptions(withLaunchOptions: nil)
        }
        Dengage.promptForPushNotifications()
    }
    

    @objc(registerForPushToken:)
    public func registerForPushToken(deviceToken: Data) {
       Dengage.register(deviceToken: token)
    }
}
