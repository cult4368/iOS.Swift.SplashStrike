//
//  MainViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 2. 7..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 부모로 사용되는 SplitView
    var splitView:FirstViewController?
    // 메인 테이블뷰
    @IBOutlet weak var tableView: UITableView!
    // 테이블뷰 데이터
    var dataArray:NSMutableArray?
    
    
    // MARK: - #. 기초 정의
    /// #. 기초 데이터 정의
    private func initData() {
        // 1. 네비게이션 셋팅
        self.setNavigationItems()
        
        // 2. 데이터 셋팅
        dataArray = NSMutableArray()
        dataArray?.add(["name":"사귄날","date":"2012-05-31","isBadge":"Y"])
        dataArray?.add(["name":"결혼기념일","date":"2017-06-18","isBadge":"N"])
        dataArray?.add(["name":"DDay 앱","date":"2014-05-13","isBadge":"N"])
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - #. 네비게이션 만들기
    private func setNavigationItems() {
        self.title = "디데이"
    }
    
    @IBAction func goDetail(_ sender: UIButton) {
        let desc:DetailViewController = splitView?.detail as! DetailViewController
        let nv:UINavigationController = UINavigationController(rootViewController: desc)
        self.showDetailViewController(nv, sender: self)
        
        //        if UIDevice.current.userInterfaceIdiom == .phone {
        //            navigationController?.pushViewController(desc, animated:true)
        //        } else {
        //            print("패드는 푸시가 아니라 데이터 던져 주기.")
        //        }
    }
    
    // MARK: - #. TableView 꾸미기
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        
        let dic:NSDictionary = dataArray?.object(at: indexPath.row) as! NSDictionary
        
        cell.textLabel?.text = dic["name"] as? String ?? ""
        cell.detailTextLabel?.text = dic["date"] as? String ?? ""
        
        return cell
    }
    
    // MARK: - #. TableView 셀렉트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic:NSDictionary = dataArray?.object(at: indexPath.row) as! NSDictionary
        let desc:DetailViewController = splitView?.detail as! DetailViewController
        desc.loadData(dic)
        let nv:UINavigationController = UINavigationController(rootViewController: desc)
        self.showDetailViewController(nv, sender: self)
    }
    
}

