//
//  Preference.swift
//  ios-movstone
//
//  Created by JeongSik Kim on 17/01/2019.
//  Copyright © 2019 Hecas. All rights reserved.
//

struct Preference {
    static var defaultInstance = Preference()
    
    var uri: String? = "rtmp://mls1.xdn.kr:1935/app01"
    var streamName: String? = "live"
}
