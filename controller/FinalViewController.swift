//
//  FinalViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/29.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var value = "空です"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = value
    }
    

    
    @IBAction func didClickModalButton(_ sender: UIButton) {
        let score = label.text
        performSegue(withIdentifier: "ModalSegue", sender: score)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ModalSegue") {
            let nextVC = segue.destination as! ModalViewController
            nextVC.score = sender as! String
        }
    }

    
    @IBAction func didClickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
}
