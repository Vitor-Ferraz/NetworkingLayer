//
//  ViewController.swift
//  Networking Layer
//
//  Created by Vitor Ferraz on 14/06/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ProductRepository().getBannerList { (list) in
            dump(list)
        }
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

