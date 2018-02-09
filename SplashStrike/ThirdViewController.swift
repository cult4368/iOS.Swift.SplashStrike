//
//  ThirdViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 1. 28..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit
import DLRadioButton

class ThirdViewController : UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    // The sample values
    var values = ["고릴라볼링장", "썬더볼링장", "KB볼링장", "볼케이노볼링장", "라인볼링장", "성남가인볼링장", "성남AMF볼링장"]
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var openRadioButton: DLRadioButton!
    @IBOutlet weak var allRadioButton: DLRadioButton!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var scoreTextField: UITextField!
    
    @IBAction func onSubmit(_ sender: Any) {
        return 
    }
    
    // Using simple subclass to prevent the copy/paste menu
    // This is optional, and a given app may want a standard UITextField
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // If user changes text, hide the tableView
    @IBAction func textFieldChanged(_ sender: AnyObject) {
        tableView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 내비게이션 타이틀 초기화
        self.naviTitle()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        locationTextField.delegate = self
        
        tableView.isHidden = true
        
        // Manage tableView visibility via TouchDown in textField
        locationTextField.addTarget(self, action: #selector(textFieldActive), for: UIControlEvents.touchDown)
        
        // radioButton Drawing
        self.openRadioButton.isMultipleSelectionEnabled = false;
        self.openRadioButton.isIconOnRight = true;
        self.allRadioButton.isIconOnRight = true;
        
        var otherButtons : [DLRadioButton] = [];
        otherButtons.append(self.allRadioButton)
        
        self.openRadioButton.otherButtons = otherButtons

    }

    func naviTitle() {
        // ① 내비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // ② 속성 설정
        nTitle.numberOfLines = 2 // 두 줄까지 표시되도록 설정
        nTitle.textAlignment = .center // 중앙 정렬
        nTitle.textColor = UIColor.white // 추가된 구문) 텍스트 색상 설정
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "점수입력"
        
        // ③ 내비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
        
        // 추가된 구문) 배경 색상 설정
        let color = UIColor(red:0.02, green:0.22, blue:0.49, alpha:1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    // Manage keyboard and tableView visibility
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch:UITouch = touches.first else
        {
            return;
        }
        if touch.view != tableView
        {
            locationTextField.endEditing(true)
            tableView.isHidden = true
        }
    }
    
    // Toggle the tableView visibility when click on textField
    @objc func textFieldActive() {
        tableView.isHidden = !tableView.isHidden
    }
    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        // TODO: Your app can do something when textField finishes editing
        print("The textField ended editing. Do something based on app requirements.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        // Set text from the data model
        cell.textLabel?.text = values[indexPath.row]
        cell.textLabel?.font = locationTextField.font
        return cell
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Row selected, so set textField to relevant value, hide tableView
        // endEditing can trigger some other action according to requirements
        locationTextField.text = values[indexPath.row]
        tableView.isHidden = true
        locationTextField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    
    // MARK: Helper
    
    private func createRadioButton(frame : CGRect, title : String, color : UIColor) -> DLRadioButton {
        let radioButton = DLRadioButton(frame: frame);
        radioButton.titleLabel!.font = UIFont.systemFont(ofSize: 14);
        radioButton.setTitle(title, for: []);
        radioButton.setTitleColor(color, for: []);
        radioButton.iconColor = color;
        radioButton.indicatorColor = color;
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
        radioButton.addTarget(self, action: #selector(ThirdViewController.logSelectedButton), for: UIControlEvents.touchUpInside);
        self.view.addSubview(radioButton);
        
        return radioButton;
    }
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
    }
}
