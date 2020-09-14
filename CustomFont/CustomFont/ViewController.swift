//
//  ViewController.swift
//  CustomFont
//
//  Created by jung on 2020/09/14.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnLbl: UIButton!
    @IBOutlet weak var textLbl: UILabel!
    
    let fontArr = ["Apple Color Emoji","Chalkduster","Cochin","Copperplate","Zapfino","DIN Condensed"]
    var fontNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeBtn(_ sender: Any) {
        let curfont = UIFont(name: fontArr[fontNumber], size: 35)
        fontNumber = fontNumber < 5 ? fontNumber + 1 : 0
        textLbl.font = curfont
        btnLbl.titleLabel?.font = curfont
    }
    
}

