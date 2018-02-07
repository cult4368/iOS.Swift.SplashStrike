//
//  FourthViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

class FourthViewController : UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 내비게이션 타이틀 초기화
        self.naviTitle()
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "네 번째 탭"
        title.textColor = UIColor.red // 텍스트는 빨간색으로
        title.textAlignment = .center // 레이블 내에서 중앙 정렬로
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 System Font, 14pt
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2 // x 축의 중앙에 오도록
        
        self.view.addSubview(title)
    }

    func naviTitle() {
        // ① 내비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // ② 속성 설정
        nTitle.numberOfLines = 2 // 두 줄까지 표시되도록 설정
        nTitle.textAlignment = .center // 중앙 정렬
        nTitle.textColor = UIColor.white // 추가된 구문) 텍스트 색상 설정
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "공지사항"
        
        // ③ 내비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
        
        // 추가된 구문) 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
}
