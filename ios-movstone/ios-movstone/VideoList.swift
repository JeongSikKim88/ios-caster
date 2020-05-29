//
//  VideoList.swift
//  ios-movstone
//
//  Created by JeongSik Kim on 18/01/2019.
//  Copyright © 2019 Hecas. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class VideoList: UIViewController {
    
    var url2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguePlayerController"{
            let destination = segue.destination as! VideoView
            destination.url = url2
        }
    }
}
