//
//  ThirdViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

class ThirdViewController : UIViewController {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 내비게이션 타이틀 초기화
        self.initTitleNew()
        
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "세 번째 탭"
        title.textColor = UIColor.red // 텍스트는 빨간색으로
        title.textAlignment = .center // 레이블 내에서 중앙 정렬로
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 System Font, 14pt
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2 // x 축의 중앙에 오도록
        
        self.view.addSubview(title)
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
    
    // 텍스트 필드를 이용하여 타이틀을 구성하는 메소드
    func initTitleInput() {
        // 텍스트 필드 객체 생성
        let tf = UITextField()
        
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white // 배경 색상을 흰색으로
        tf.font = UIFont.systemFont(ofSize: 13) // 입력할 글씨 크기를 13픽셀로
        tf.autocapitalizationType = .none // 자동 대문자 변환 속성은 사용하지 않도록
        tf.autocorrectionType = .no // 자동 입력 기능 해제
        tf.spellCheckingType = .no // 스펠링 체크 기능 해제
        tf.keyboardType = .URL // URL 입력 전용 키보드
        tf.keyboardAppearance = .dark
        tf.layer.borderWidth = 0.3 // 테두리 경계선 두께
        tf.layer.borderColor = UIColor(red:0.60, green:0.60, blue:0.60,
                                       alpha:1.0).cgColor
        // 타이틀 뷰 속성에 대입
        self.navigationItem.titleView = tf
        
        // 왼쪽 아이템 영역에 들어갈 뷰
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        
        // 왼쪽 아이템 영역에 이미지 뷰 설정
        self.navigationItem.leftBarButtonItem = leftItem
        
        // STEP 1) 오른쪽 아이템 영역에 들어갈 컨테이너 뷰
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        
        // STEP 2) 카운트 값을 표시할 레이블 구성
        let cnt = UILabel()
        
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        cnt.layer.cornerRadius = 3 // 모서리 둥글게 처리
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        // 레이블을 서브 뷰로 추가
        rv.addSubview(cnt)
        
        // STEP 3) more 버튼 구현
        let more = UIButton(type:.system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
    }
    
    // 타이틀에 이미지를 표시하는 메소드
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        self.navigationItem.titleView = imageV
    }
    
    func initTitleNew() {
        // ① 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame:CGRect(x: 0, y: 0, width: 200, height: 36))
        
        // ② 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "58개 숙소"
        
        // ③ 하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        // ④ 상하단 레이블을 컨테이너 뷰에 추가한다.
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        // ⑤ 내비게이션 타이틀에 컨테이너 뷰를 대입한다.
        self.navigationItem.titleView = containerView
        
        // 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitle() {
        // ① 내비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // ② 속성 설정
        nTitle.numberOfLines = 2 // 두 줄까지 표시되도록 설정
        nTitle.textAlignment = .center // 중앙 정렬
        nTitle.textColor = UIColor.white // 추가된 구문) 텍스트 색상 설정
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        // ③ 내비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
        
        // 추가된 구문) 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
}
