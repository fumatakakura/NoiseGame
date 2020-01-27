//
//  FirstViewController.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/28.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import AVFoundation
import FontAwesome_swift

class FirstViewController: UIViewController {
    
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AVCaptureDevice.requestAccess(for: AVMediaType.audio, completionHandler: {(granted: Bool) in})
        
        Label.font = UIFont.fontAwesome(ofSize: 40, style: .solid)
        Label.text = String.fontAwesomeIcon(name: .questionCircle)

        
    }
    
    
    @IBAction func didClickToRecord(_ sender: Any) {
    
        performSegue(withIdentifier: "toRecord", sender: nil)
    }
    

}
