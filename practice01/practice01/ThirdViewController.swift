//
//  ThirdViewController.swift
//  practice01
//
//  Created by jung on 2020/04/25.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var lblCurTime: UILabel!
    @IBOutlet weak var lblPickTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickTime.text = formatter.string(from: datePickerView.date)
    }
}
