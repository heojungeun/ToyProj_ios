//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/09/15.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit
import AVKit

struct VideoView {
    let image: UIImage
    let title: String
    let src: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView1: UITableView!
    let cellIdentifier: String = "cell"
    
    // assets폴더 내 image를 불러오고 싶으면 image literal 선택
    let SrcArr: [VideoView] = [
        VideoView(image: #imageLiteral(resourceName: "img3"), title: "sky", src: "IMG_6961"),
        VideoView(image: #imageLiteral(resourceName: "img1"), title: "book, and travel", src: "IMG_1326"),
        VideoView(image: #imageLiteral(resourceName: "img4"), title: "twilight", src: "IMG_1386"),
        VideoView(image: #imageLiteral(resourceName: "img2"), title: "cafe", src: "IMG_6381"),
        VideoView(image: #imageLiteral(resourceName: "img5"), title: "sun catcher", src: "IMG_7038")
    ]
    
    let timeFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SrcArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ImgTableViewCell = tableView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImgTableViewCell
        
        let celltitle: String = SrcArr[indexPath.row].title
        let cellimg: UIImage = SrcArr[indexPath.row].image
        
        cell.titleLabel?.text = celltitle
        cell.bgImageView.image = cellimg
        //cell.timeLabel.text = timeFormatter.string(from: Date())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVideoView = SrcArr[indexPath.row]
        
        let filePath: String? = Bundle.main.path(forResource: selectedVideoView.src, ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    // ref https://moonibot.tistory.com/43
    private func playVideo(url: NSURL){
        // AVPlayerController instance
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController,animated: true){
            player.play()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}
