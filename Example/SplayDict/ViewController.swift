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
       
        let c = [(2, 2), (6,4)]
        var a = SplayDict<Int, Int>(c)
        a[3] = 5
        
       
        a[4] = 7
        a.insert(key: 5, value: 6)
        a[3] = 10
        
        print(a)
        
        for d in a {
            print(d)
        }
      
        
        
        let e: SplayDict<Int, Int> = [Element(1,1), Element(2,4)]
        
        
        print(e)
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

