//
//  VideoView.swift
//  ios-movstone
//
//  Created by JeongSik Kim on 18/01/2019.
//  Copyright © 2019 Hecas. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIViewController {
    
    var url: String?
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    @IBOutlet weak var videoPlayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoURL = URL(string: "http://mls1.xdn.kr:8090/app01/queen.m3u8")
        //        let videoURL = NSURL(fileURLWithPath: video!)
        player = AVPlayer(url: videoURL!)
        playerLayer = AVPlayerLayer(player: player)        // player를 붙인 AVPlayerLayer 생성
        playerLayer.videoGravity = .resize
        videoPlayer.layer.addSublayer(playerLayer)
    }
    
    
    override func viewDidLayoutSubviews() {            // subView인 playerLayer의 영역 설정
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoPlayer.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {        // view가 나타날때 player 재생
        super.viewDidAppear(animated)
        player.play()
    }
    /*
    @IBAction func playVideo(_ sender: AnyObject) {
        playerLayer.frame = videoPlayer.bounds
        player.play()


                guard let url = URL(string: "http://mls1.xdn.kr:8090/app01/queen.m3u8") else {
                    return
                }

                // Create an AVPlayer, passing it the HTTP Live Streaming URL.
                let player = AVPlayer(url: url)
        
                // Create a new AVPlayerViewController and pass it a reference to the player.
        //        let videoPlayer = AVPlayerViewController()
        //        videoPlayer.player = player
        //        let controller = AVPlayerViewController()
        //        controller.player = player
        
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = playerArea.frame
                playerArea.layer.addSublayer(playerLayer)
        
                // Modally present the player and call the player's play() method when complete.
                present(videoPlayer, animated: true) {
                    player.play()
                }
    } */
}
