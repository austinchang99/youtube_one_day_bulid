//
//  ConstantTemplate.swift
//  youtube-onedaybuild
//
//  Created by Austin Chang on 2020/7/5.
//  Copyright © 2020 Austin Chang. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = ""
    static var PLAYLIST_ID = "UUJ5v_MCY6GNUBTO8-D3XoAg"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var  VIDEOCELL_ID = "VideoCell"
}

