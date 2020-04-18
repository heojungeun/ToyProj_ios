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
    
    private let step: Double = 1.0
    private var timer: Timer?
    
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
        // start 버튼 눌렀을 때 시간 적용해서 타이머 시작하기
    }
    
    @IBAction func cancelTimer(_ sender: Any) {
        // 취소 버튼 눌렀을 때 선택시간, 남은시간 초기화하기
    }
    
}

