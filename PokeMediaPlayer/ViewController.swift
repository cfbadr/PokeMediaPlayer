//
//  ViewController.swift
//  PokeMediaPlayer
//
//  Created by Badr Choukri on 21/02/2019.
//  Copyright © 2019 Badr Choukri. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    var player:AVPlayer? = nil
    var playerController: AVPlayerViewController? = nil
    
    @IBAction func selectAction(_ sender: UIButtonExtended){
        if player == nil{
            player = AVPlayer()
            playerController = AVPlayerViewController()
        }
        if sender.tag == 1{
            guard let videoLocalPath = Bundle.main.path(forResource: "localVideo", ofType: "mp4") else{return}
            let videoUrl = URL(fileURLWithPath: videoLocalPath)
//            player = AVPlayer(url: videoUrl)
            player?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
            playerController?.player = player
        } else{
            guard let videoUrl = URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")else{return}
//            player = AVPlayer(url: videoUrl)
            player?.replaceCurrentItem(with: AVPlayerItem(url: videoUrl))
            playerController!.player = self.player
        }
        self.present(playerController!, animated: true, completion: {
            self.playerController?.player?.play()
        })
    }
}


class UIButtonExtended: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10
    }
    
}
