//
//  VideoTableViewController.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/09/16.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit
import AVKit

class VideoTableViewController: UITableViewController {

    var nameArr: [Video] = []
    
    func setupTestData(){
        nameArr = [
            Video(image: #imageLiteral(resourceName: "img3"), title: "Flower tree", source: "Youtube"),
            Video(image: #imageLiteral(resourceName: "img1"), title: "The Book", source: "Cafe"),
            Video(image: #imageLiteral(resourceName: "img2"), title: "miumiu", source: "Youtube"),
            Video(image: #imageLiteral(resourceName: "img4"), title: "Twilight", source: "Vimeo")
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTestData()
        self.tableView.register(VideoTableViewCell.self, forCellReuseIdentifier: "cell_test")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nameArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_test") as! VideoTableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = nameArr[indexPath.row].title
        cell.mainImageView.image = nameArr[indexPath.row].image
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goView = self.storyboard?.instantiateViewController(withIdentifier: "gofirst") as! ViewController
        
        self.navigationController?.pushViewController(goView, animated: true)
        goView.receiveItem(nameArr[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = nameArr[indexPath.row].image
        let imageRatio = currentImage.getImageRatio()
        return tableView.frame.width / imageRatio
    }

}

// ref: https://medium.com/@Archetapp/sizing-uitableview-cells-to-fit-images-swift-in-xcode-13228d139c1a
extension UIImage {
    func getImageRatio() -> CGFloat {
        let imageRatio = CGFloat(self.size.width / self.size.height)
        return imageRatio
    }
}
