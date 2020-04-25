//
//  ThirdViewController.swift
//  practice01
//
//  Created by jung on 2020/04/25.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let timeSelector: Selector = #selector(ThirdViewController.updateTime)
    let interval = 1.0
    var cnt = 0
    var alarmTime: String?
    
    @IBOutlet weak var lblCurTime: UILabel!
    @IBOutlet weak var lblPickTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickTime.text = formatter.string(from: datePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc
    func updateTime(){
//        lblCurTime.text = String(cnt)
//        cnt = cnt + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurTime.text = formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm:ss aaa"
        let chcurtime = formatter.string(from: date as Date)
        if (alarmTime == chcurtime){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
}
