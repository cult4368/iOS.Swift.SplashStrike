//
//  FifthViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit
import WebKit

class FifthViewController : UIViewController, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate {
  
    var webView: WKWebView!
    //@IBOutlet weak var webView: WKWebView!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func loadView() {
        super.loadView()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self

        self.view = webView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 내비게이션 타이틀 초기화
        self.naviTitle()
        
        let targetUrl = "http://www.naver.com"
        let url = URL(string: targetUrl)
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        webView.scrollView.delegate = self
        webView.scrollView.isScrollEnabled = true
   
        //abilito lo zoom nella webView
        webView.isUserInteractionEnabled = true
        webView.allowsBackForwardNavigationGestures = true
        
        //webView.scrollView.bounces = false
        
    }

    // Disable Zoom for WebView
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.x > 0){
            scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
        if (scrollView.contentOffset.y == 0) {
            print("didScroll")
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let scrollPoint = CGPoint(x: 0, y: self.webView.scrollView.contentSize.height - self.webView.frame.size.height)
        self.webView.scrollView.setContentOffset(scrollPoint, animated: true) // Set false if you doesn't want animation
        self.webView.scrollView.showsHorizontalScrollIndicator = false
    }
    
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let otherAction = UIAlertAction(title: "OK", style: .default, handler: {action in completionHandler()})
        alert.addAction(otherAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Swift.Void) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: {(action) in completionHandler(false)})
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in completionHandler(true)})
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect(x: view.frame.midX-50, y: view.frame.midY-50, width: 100, height:100)
        activityIndicator.color = UIColor.red
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
    }
    
    @available(iOS 8.0, *)
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        //activityIndicator.stopAnimation()
        self.activityIndicator.removeFromSuperview()
    }
    
    func naviTitle() {
        // ① 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame:CGRect(x: 0, y: 0, width: 200, height: 36))
        
        // ② 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "회칙"
        
        // ③ 하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "(2018년도)"
        
        // ④ 상하단 레이블을 컨테이너 뷰에 추가한다.
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        // ⑤ 내비게이션 타이틀에 컨테이너 뷰를 대입한다.
        self.navigationItem.titleView = containerView
        
        // 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
}

