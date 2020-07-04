//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/5.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos(){
        // Create an URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, reponse, error) in
            // Chech if there were any error
            if error != nil || data == nil{
                return
            }
            
            do{
                // parsing data into video objects
                           let decoder = JSONDecoder()
                           decoder.dateDecodingStrategy = .iso8601
                           let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch{
                
            }
           
            
            
            
            
        }
        
        // kick off the task
        dataTask.resume()
    }
}
