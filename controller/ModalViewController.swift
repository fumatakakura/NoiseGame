//
//  ModalViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/29.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import Firebase

class ModalViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var score = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = score
        
    }
    

    @IBAction func didClickBitton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    //登録ボタン
    @IBAction func didClickButton(_ sender: UIButton) {
        let db = Firestore.firestore()
        db.collection("score").addDocument(data: ["name" : textField.text!, "score" : Int(label.text!)]){error in
            if let err = error {
                print(err.localizedDescription)
            } else {
                print("登録完了")
            }
        }
        performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
}
