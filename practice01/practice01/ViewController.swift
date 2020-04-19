//
//  ViewController.swift
//  practice01
//
//  Created by jung on 2020/04/19.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstlbl: UILabel!
    @IBOutlet weak var seclbl: UILabel!
    @IBOutlet weak var chgtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func firstbtn(_ sender: UIButton) {
        firstlbl.text = "Hello, \n" + chgtxt.text!
    }
    
    @IBAction func secbtn(_ sender: UIButton) {
        seclbl.text = "Hello, \n" + chgtxt.text!
    }
    
    
}

