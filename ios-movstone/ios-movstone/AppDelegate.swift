//
//  AppDelegate.swift
//  ios-movstone
//
//  Created by JeongSik Kim on 03/01/2019.
//  Copyright © 2019 Hecas. All rights reserved.
//


/*
 UIApplicationMain함수를 호출하고 AppDelegate클래스의 이름을 delegate 클래스에 전달하는 것
 시스템은 응용프로그램 객체(application object) 를 생성
 또한 시스템은 AppDelegate클래스의 인스턴스를 생성하고 이를 응용프로그램 객체(application object)에 할당
 */

import UIKit
import AVFoundation
import HaishinKit
import Logboard

let logger = Logboard.with("kr.co.hecaslab.ios-movstone")

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    /*프로퍼티는 앱의 창(window)에 대한 참조를 저장합니다.
     이 창(window)은 앱의 view계층구조의 루트를 나타냅니다. 이는 앱 콘텐츠가 모두 그려지는 곳입니다.
     window프로퍼티는 Optional 프로퍼티입니다.(UIWindow?로 되어있죠?)
     즉, 어떨때는 아무런 값 도 가질 수 없다(nil)는 것을 의미*/


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 1.0)
        AssetPersistenceManager.sharedManager.restorePersistenceManager()
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setPreferredSampleRate(44_100)
            // https://stackoverflow.com/questions/51010390/avaudiosession-setcategory-swift-4-2-ios-12-play-sound-on-silent
            if #available(iOS 10.0, *) {
                try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            } else {
                session.perform(NSSelectorFromString("setCategory:withOptions:error:"), with: AVAudioSession.Category.playAndRecord, with: [AVAudioSession.CategoryOptions.allowBluetooth])
                try? session.setMode(.default)
            }
            try session.setActive(true)
        } catch {
        }
        
        // Getting the shared instance of the audio session and setting audio to continue playback when the screen is locked.
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
//        }
//        catch {
//            print("Setting category to AVAudioSessionCategoryPlayback failed.")
//        }
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

