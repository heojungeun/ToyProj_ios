//
//  ViewController.swift
//  firebasePush
//
//  Created by jung on 2020/09/09.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer = Timer()
    var isPlaying = false
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = timeFormatter(counter)
        pauseBtn.isEnabled = false
    }

    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        startBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = timeFormatter(counter)
    }
    
    @objc func UpdateTimer(){
        counter = counter + 1
        timeLabel.text = timeFormatter(counter)
    }
    
    func timeFormatter(_ intTime: Int) -> String {
        let min = (intTime % 3600) / 60
        let sec = (intTime % 3600) % 60
        
        let minStr = min < 10 ? "0\(min)" : String(min)
        let secStr = sec < 10 ? "0\(sec)" : String(sec)
        
        return "\(minStr):\(secStr)"
    }
    
}

