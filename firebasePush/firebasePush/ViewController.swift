//
//  ViewController.swift
//  firebasePush
//
//  Created by jung on 2020/09/09.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var secLbl: UILabel!
    @IBOutlet weak var msecLbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChangeLabel(timeFormatter(counter))
        pauseBtn.isEnabled = false
    }

    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying){
            return
        }
        startBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
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
        //timeLabel.text = timeFormatter(counter)
        ChangeLabel(timeFormatter(counter))
    }
    
    @objc func UpdateTimer(){
        counter = counter + 0.001
        ChangeLabel(timeFormatter(counter))
    }
    
    func ChangeLabel(_ timeStr: String){
        let timeSplit = timeStr.split(separator: ":")
        minLbl.text = String(timeSplit[0])
        secLbl.text = String(timeSplit[1])
        msecLbl.text = String(timeSplit[2])
    }
    
    // 참고한 사이트 : http://yoonbumtae.com/?p=2310
    func timeFormatter(_ intTimeinterval: TimeInterval) -> String {
        let intTime = NSInteger(intTimeinterval)
        
        let min = (intTime % 3600) / 60
        let sec = (intTime % 3600) % 60
        let msec = Int((intTimeinterval.truncatingRemainder(dividingBy: 1)) * 1000) / 10
        
//        let minStr = min < 10 ? "0\(min)" : String(min)
//        let secStr = sec < 10 ? "0\(sec)" : String(sec)
        
        //return "\(minStr):\(secStr)"
        return String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
}

