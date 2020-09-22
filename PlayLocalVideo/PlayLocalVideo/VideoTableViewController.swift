//
//  VideoTableViewController.swift
//  PlayLocalVideo
//
//  Created by jung on 2020/09/16.
//  Copyright © 2020 jung. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {

    let nameArr = ["son","kim","park","hong"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_test", for: indexPath) as! VideoTableViewCell
        cell.name.text = nameArr[indexPath.row]
        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goView = self.storyboard?.instantiateViewController(withIdentifier: "gofirst") as! ViewController
        
        self.navigationController?.pushViewController(goView, animated: true)
        goView.receiveItem(nameArr[indexPath.row])
    }

}
