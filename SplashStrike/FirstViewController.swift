//
//  FirstViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class FirstViewController: UIViewController {

    var user: UserInfo!
    
    @IBAction func btnLogout(_ sender: Any) {
        
        if user.joinAddress == "google" {
            let firebaseAuth = Auth.auth()
            do {
                try
                    firebaseAuth.signOut()
                GIDSignIn.sharedInstance().signOut()
                gotoLoginViewController()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }
    
    @IBOutlet weak var leftContainer: UIView!
    @IBOutlet weak var rightContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.naviTitle()

        guard user != nil else {
            print("user nil")
            return
        }
        
        //txtUserID.text = user.email
        print("FirstViewController:viewDidLoad user : \(String(describing: user?.email))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        //tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        UIView.animate(withDuration: TimeInterval(0.15)) {
            // alpha 값이 0이면 1로, 1이면 0으로 바꾸어 준다.
            // 호출될 때마다 점점 투명해졌다가 점점 진해질 것이다.
            tabBar?.alpha = ( tabBar?.alpha == 0 ? 1 : 0 )
        }
    }
    
    
    func gotoLoginViewController(){
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewID" ) as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func naviTitle() {
        // ① 내비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // ② 속성 설정
        nTitle.numberOfLines = 2 // 두 줄까지 표시되도록 설정
        nTitle.textAlignment = .center // 중앙 정렬
        nTitle.textColor = UIColor.white // 추가된 구문) 텍스트 색상 설정
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "HOME"
        
        // ③ 내비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
        
        // 추가된 구문) 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
     
}


