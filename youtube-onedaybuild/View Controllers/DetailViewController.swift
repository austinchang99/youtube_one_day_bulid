//
//  DetailViewController.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/12.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // clear the fields
        titleLabel.text = ""
        dataLabel.text = ""
        textView.text = ""
        
        
        
        // check if there is a video
        guard video != nil else{
            return
        }
        // create embed url
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        //load it into a web view
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text  = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dataLabel.text = df.string(from: video!.published)
        
        textView.text = video!.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
