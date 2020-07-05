//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/2.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set itself as the data sourse and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        // set itself as the delegate of the model
        
        model.delegate = self
        
        model.getVideos()
        
    }
    // MARK: - Model delegate methods
    func videosFetched(videos: [Video]) {
        
        // send the returned videos to our video property
        self.videos = videos
        // refresh the tableview
        tableView.reloadData()
    }
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the cell with data
        // Get the title for the video in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

