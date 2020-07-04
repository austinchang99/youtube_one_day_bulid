//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/2.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

