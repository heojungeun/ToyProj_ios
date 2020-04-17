//
//  ViewController.swift
//  TimePatternTimer
//
//  Created by jung on 2020/04/17.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var IblPickerTime: UILabel!
    @IBOutlet var IblRestTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // 전달 인수 저장
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        IblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }

    @IBAction func startTimer(_ sender: Any) {
        
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        
    }
}

