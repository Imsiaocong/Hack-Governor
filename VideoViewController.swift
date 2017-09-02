//
//  VideoViewController.swift
//  XProject
//
//  Created by Di Wang on 2017/8/22.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: AVPlayerViewController, AVPlayerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //playVideo()
        //navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "IMG_0252", ofType:"MOV") else {
            debugPrint("video not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    
    func playerDidFinishPlaying(note: NSNotification){
        self.dismiss(animated: true, completion: nil)
    }

}
