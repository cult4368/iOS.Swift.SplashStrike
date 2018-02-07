//
//  DetailViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 2. 7..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 부모로 사용되는 SplitView
    var splitView:FirstViewController?
    
    @IBOutlet weak var detailText: UILabel!
    // MARK: - #. 기초 정의
    /// #. 기초 데이터 정의
    private func initData() {
        // 1. 네비게이션 셋팅
        self.setNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - #. 네비게이션 만들기
    private func setNavigationItems() {
        self.title = "상세화면"
    }
    
    //MARK: - #. 외부에서 들어오는 데이터 셋
    public func loadData(_ dic:NSDictionary) {
        self.title = dic["name"] as? String ?? "상세화면"
        self.detailText.text = dic["date"] as? String ?? "상세화면 입니다."
        
    }

}
