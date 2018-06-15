//
//  ViewController.swift
//  SplayDict
//
//  Created by QuqqU on 06/14/2018.
//  Copyright (c) 2018 QuqqU. All rights reserved.
//

import UIKit
import SplayDict

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let a = SplayDict<Int, Int>()
        a[3] = 5
        a[4] = 7
        a.insert(key: 5, value: 6)
        a[3] = 10
        
        
        let (c, d) = a.top!
        a.top?.key
        a.topKey
        let b = a[10] {20}
        print(b)
        dump(a)
        
        
        a.elements
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

