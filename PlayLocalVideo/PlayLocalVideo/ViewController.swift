//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/09/15.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rItem = ""
    
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        name.text = rItem
    }
    
    func receiveItem(_ item: String){
        rItem = item
    }
    
    // 화면 전환 방법: https://medium.com/@twih1203/swift-ios-%ED%99%94%EB%A9%B4%EC%A0%84%ED%99%98%ED%95%98%EA%B8%B0-5e5998679d3a
    @IBAction func goSecond(_ sender: Any) {
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
}

