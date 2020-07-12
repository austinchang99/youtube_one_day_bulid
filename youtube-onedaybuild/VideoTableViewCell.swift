//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/5.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell( v:Video){
        self.video = v
        // ensure we have a video
        guard self.video != nil else{
            return
        }
        // set the title and date label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // set the thumbnail
        
        guard video!.thumbnail != "" else{
            return
        }
        
        // check cache before downing data
        
        if let cacheData = CacheManager.getVideoCache(url: self.video!.thumbnail){
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        
        //download thumbnaul data
        let url = URL(string: self.video!.thumbnail)
        
        //get the share url session object
        let session = URLSession.shared
        
        // create a data task
        let dataTask = session.dataTask(with: url!){ (data, response, error) in
            
            if error == nil && data != nil{
                
                CacheManager.setVideoCache(url: url!.absoluteString, data: data)
                
                if url!.absoluteString != self.video?.thumbnail{
                    return
                }
                // create image object
                let image = UIImage(data: data!)
                // set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
            
        }
        // start data task
        dataTask.resume()
    }

}
