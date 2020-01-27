//
//  RankingViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/30.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Firebase


class RankingViewController: UIViewController {
    
    var rankings: [Ranking] = []
    
    //スコア
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    //名前
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    
    //冠アイコン
    @IBOutlet weak var label1st: UILabel!
    @IBOutlet weak var label2nd: UILabel!
    @IBOutlet weak var label3rd: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = Firestore.firestore()
        

        db.collection("score").order(by: "score", descending: true).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                return
            }
            
            var results: [Ranking] = []
            for document in documents {
                let name = document.get("name") as! String
                let score = document.get("score") as! Int
                let rank = Ranking(name: name, score: score)
                
                results.append(rank)
            }
            
            self.rankings = results
                        
            //スコアランキング
            self.label1.text = String(self.rankings[0].score)
            self.label2.text = String(self.rankings[1].score)
            self.label3.text = String(self.rankings[2].score)
            
            //名前ランキング
            self.nameLabel1.text = self.rankings[0].name
            self.nameLabel2.text = self.rankings[1].name
            self.nameLabel3.text = self.rankings[2].name
        }
        

        
        //冠アイコン
        label1st.font = UIFont.fontAwesome(ofSize: 50, style: .solid)
        label1st.text = String.fontAwesomeIcon(name: .crown)
        label1st.textColor = UIColor.yellow
        
        label2nd.font = UIFont.fontAwesome(ofSize: 40, style: .solid)
        label2nd.text = String.fontAwesomeIcon(name: .crown)
        label2nd.textColor = UIColor.lightGray
        
        label3rd.font = UIFont.fontAwesome(ofSize: 30, style: .solid)
        label3rd.text = String.fontAwesomeIcon(name: .crown)
        label3rd.textColor = UIColor.brown
        
    }
}
