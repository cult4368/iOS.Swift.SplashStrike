//
//  RightViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 2. 7..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit

struct Score {
    let type: String
    let score: Int
    let playDate: Date
    let insertDate: Date
    let tag: String
    let location: String
}

class RightViewController: UIViewController {

    @IBOutlet weak var scoreCollectionView: UICollectionView!
    
    var scoreList = [
        Score(type: "Open", score: 256, playDate: Date(), insertDate: Date(), tag: "[공식전]", location: "썬더볼링장"),
        Score(type: "Open", score: 213, playDate: Date(), insertDate: Date(), tag: "[공식전]", location: "KB볼링장"),
        Score(type: "ALL", score: 221, playDate: Date(), insertDate: Date(), tag: "[공식전]", location: "썬더볼링장"),
        Score(type: "Open", score: 193, playDate: Date(), insertDate: Date(), tag: "[정기전]", location: "고릴라볼링장"),
        Score(type: "Open", score: 208, playDate: Date(), insertDate: Date(), tag: "[정기전]", location: "고릴라볼링장"),
        Score(type: "Open", score: 213, playDate: Date(), insertDate: Date(), tag: "[공식전]", location: "KB볼링장"),
        Score(type: "ALL", score: 221, playDate: Date(), insertDate: Date(), tag: "[공식전]", location: "썬더볼링장"),
        Score(type: "Open", score: 193, playDate: Date(), insertDate: Date(), tag: "[정기전]", location: "고릴라볼링장"),
        Score(type: "Open", score: 208, playDate: Date(), insertDate: Date(), tag: "[정기전]", location: "고릴라볼링장")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func alertAction(title: String, msg: String){
        let alertDialog = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        //UIAlertControllerStyle.actionSheet 는 화면 하단에 표시함
        
        alertDialog.addAction(UIAlertAction(title:"OK", style: .default, handler: {(action: UIAlertAction!) in
            //Action
            //print("버튼 텍스트 확인")
        }))
        present(alertDialog, animated: true, completion: nil)
    }
    
    lazy var df: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "M월 d일(E)"
        return f
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RightViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return scoreList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScoreCollectionViewCell
        
        let target = scoreList[indexPath.item]
        cell.scoreImageView.image = UIImage(named: target.type)
        cell.scoreLabel.text = "\(target.score)"
        
        if let play = df.string(for: target.playDate) {
            cell.playDateLabel.text = "\(play)"
        }

        cell.tagLabel.text = target.tag
        
        cell.locationLabel.text = target.location
        
        
        return cell
        
        
        
        
    }
    
    
}




