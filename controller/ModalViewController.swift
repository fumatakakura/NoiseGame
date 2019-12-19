//
//  ModalViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/29.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import RealmSwift

class ModalViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var score = ""
    
    var itemList: Results<ScoreModel>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = score
        
    }
    
    //モーダル解除
    @IBAction func didClickBitton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //登録ボタン
    @IBAction func didClickButton(_ sender: UIButton) {
        
        let name = textField.text
        let score = Int(label.text!)
        
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let scoreModel = ScoreModel()
        
        scoreModel.name = name!
        scoreModel.score = score!
        
        try! realm.write {
            realm.add(scoreModel)
        }
        
        
        
        performSegue(withIdentifier: "toFirst", sender: nil)
    }
    

}
