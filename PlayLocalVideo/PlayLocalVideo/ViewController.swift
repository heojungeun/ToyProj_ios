//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/09/15.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func goSecond(_ sender: Any) {
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
}

