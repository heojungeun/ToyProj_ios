//
//  ViewController.swift
//  TimePatternTimer
//
//  Created by jung on 2020/04/17.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime: Date?
    var currentTime: Date?
    
    //timer
    var mTimer : Timer?
    
    @IBOutlet var IblPickerTime: UILabel!
    @IBOutlet var IblRestTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        alarmTime = formatter.date(from: "00:01:00")
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender // 전달 인수 저장
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        IblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        alarmTime = datePickerView.date
    }

    @IBAction func startTimer(_ sender: Any) {
        // start 버튼 눌렀을 때 시간 적용해서 타이머 시작하기
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        // 취소 버튼 눌렀을 때 선택시간, 남은시간 초기화하기
        if let timer = mTimer{
            if(timer.isValid){
                timer.invalidate()
            }
        }
        
        IblPickerTime.text = "선택 시간 : "
        IblRestTime.text = "남은 시간 : "
    }
    
    @objc
    func updateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        currentTime = formatter.date(from: "00:00:00")
        alarmTime?.addTimeInterval(TimeInterval(-1.0))
        IblRestTime.text = "남은 시간 : " + formatter.string(from: alarmTime!)
        if (alarmTime == currentTime){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
}

