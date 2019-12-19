//
//  RankingViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/30.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import RealmSwift
import FontAwesome_swift


class RankingViewController: UIViewController {
    
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

        let realm = try! Realm()
        
        let result = realm.objects(ScoreModel.self).sorted(byKeyPath: "score", ascending: false)
        
        //スコアランキング
        label1.text = String(result[0].score)
        label2.text = String(result[1].score)
        label3.text = String(result[2].score)
        
        //名前ランキング
        nameLabel1.text = result[0].name
        nameLabel2.text = result[1].name
        nameLabel3.text = result[2].name
        
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
