//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/12.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import Foundation

class CacheManager {
    static var cache = [String:Data]()
    static func setVideoCache( url: String, data: Data?){
        cache[url] = data
    }
    static func getVideoCache ( url:String) -> Data?{
        return cache[url]
    }
}
