//
//  ViewController.swift
//  practice02
//
//  Created by jung on 2020/05/10.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    var imageFileName = [
        "m1.png", "m2.png" , "m3.png" , "m4.png" , "m5.png" , "m6.png"
    ]

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var IblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return imageFileName.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row]
    }
}

