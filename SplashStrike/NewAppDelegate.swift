//
//  NewAppDelegate.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

//@UIApplicationMain Attribute는 프로젝트 내에서 유일해야한다.
//따라서 AppDelegate에서 @UIApplicationMain를 삭제해야 한다.

class NewAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]? = nil) -> Bool {
        // 1) 탭 바 컨트롤러를 생성하고, 배경을 흰색으로 채운다.
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        // 2) 생성된 tbC를 루트 뷰 컨트롤러로 등록한다.
        self.window?.rootViewController = tbC
        
        // 3) 각 탭 바 아이템에 연결될 뷰 컨트롤러 객체를 생성한다.
        let view01 = FirstViewController()
        let view02 = SecondViewController()
        let view03 = ThirdViewController()
        let view04 = FourthViewController()
        let view05 = FifthViewController()
        
        // 4) 생성된 뷰 컨트롤러 객체들을 탭 바 컨트롤러에 등록한다.
        tbC.setViewControllers([view01, view02, view03, view04, view05], animated: false)
        
        // 5) 개별 탭 바 아이템의 속성을 설정한다.
        view01.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "calendar"), selectedImage: nil)
        view02.tabBarItem = UITabBarItem(title: "통계",     image: UIImage(named: "file-tree"), selectedImage: nil)
        view03.tabBarItem = UITabBarItem(title: "점수입력",    image: UIImage(named: "photo"), selectedImage: nil)
        view04.tabBarItem = UITabBarItem(title: "공지",    image: UIImage(named: "photo"), selectedImage: nil)
        view05.tabBarItem = UITabBarItem(title: "회칙",    image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
    }
}

