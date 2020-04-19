//
//  secondViewController.swift
//  practice01
//
//  Created by jung on 2020/04/19.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var scalelbl: UIButton!
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgOn = #imageLiteral(resourceName: "bulblight")
        imgOff = #imageLiteral(resourceName: "bulbblack")
        
        imgview.image = imgOn
    }
    
    @IBAction func scalebtn(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (isZoom){
            // true 확대된 상태일때
            newWidth = imgview.frame.width/scale
            newHeight = imgview.frame.height/scale
            imgview.frame.size = CGSize(width: newWidth, height: newHeight)
            scalelbl.setTitle("확대", for: .normal)
        }else{
            //false
            newWidth = imgview.frame.width*scale
            newHeight = imgview.frame.height*scale
            imgview.frame.size = CGSize(width: newWidth, height: newHeight)
            scalelbl.setTitle("축소", for: .normal)
        }
        isZoom = !isZoom
    }
    
    @IBAction func switchImgonoff(_ sender: UISwitch) {
        if sender.isOn {
            imgview.image = imgOn
        }else{
            imgview.image = imgOff
        }
    }
}
