//
//  FirstViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/28.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toRecord", sender: nil)
        
    }
    
    


}
