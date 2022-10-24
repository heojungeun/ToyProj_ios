//
//  ViewController.swift
//  proj06TodayRandom
//
//  Created by jung on 2022/10/24.
//  Copyright © 2022 jung. All rights reserved.
//

import UIKit
// import alamofire

class ViewController: UIViewController {

    @IBOutlet weak var channelTableView: UITableView!
    
    var ONEUL_CHANNEL: Array<channel> = []
    var channelType: Array<String> = ["weather", "number", "english", "cheer", "color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelTableView.dataSource = self
        channelTableView.delegate = self
    }

}

extension ViewController {
    
    func getWeather(){
        // TODO: - 날씨 api 요청
    }
    
    func getNumber(){
        
    }
    
    func getColor(){
        
    }
    
    func getCheer(){
        
    }
}

struct channel: Codable {
    var title: String
    var content: String
    var type: String
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ONEUL_CHANNEL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChannelTableViewCell_identifier, for: indexPath) as! ChannelTableViewCell
        cell.updateCell(ONEUL_CHANNEL[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    
}
