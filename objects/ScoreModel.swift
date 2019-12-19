//
//  ScoreModel.swift
//  AudioTestProject
//
//  Created by 高倉楓麻 on 2019/11/30.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import Foundation
import RealmSwift


class ScoreModel: Object{
    
    @objc dynamic var name: String = ""
    @objc dynamic var score: Int = 0
    

    
}
