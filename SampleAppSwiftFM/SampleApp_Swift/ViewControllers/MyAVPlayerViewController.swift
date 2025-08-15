//
//  MyAVPlayerViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit
import AVKit

class MyAVPlayerViewController: UIViewController {
    
    var pip : AVPictureInPictureController!
    var currentPlayerVC:  AVPlayerViewController?
    private(set) var lastPlayerVC: AVPlayerViewController?
    
    private lazy var myAVPlayerView: MyAVPlayerView = {
        let view = MyAVPlayerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "My AVPlayer"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        myAVPlayerView.delegate = self
        myAVPlayerView.loadViewSetup(myAVPlayerView, parentView: self.view)
    }
    
    
}

extension MyAVPlayerViewController: myAVPlayerViewDelegate, AVPlayerViewControllerDelegate {
    
    func playVideo() {
        let path = Bundle.main.path(forResource: "Apple", ofType: "mp4")!
        let url = NSURL(fileURLWithPath: path)
        
        let player = AVPlayer(url: url as URL)
        
        let playerController = AVPlayerViewController()
        playerController.delegate = self
        currentPlayerVC = playerController
        playerController.player = player
        playerController.videoGravity = .resizeAspectFill
        
        self.present(playerController, animated: true) {
            self.killVideoPlayer()
            //player.play()
        }
    }
    
    private func killVideoPlayer(){
        lastPlayerVC?.player?.pause()
        lastPlayerVC?.player = nil
        lastPlayerVC?.dismiss(animated: false, completion: nil)
        self.updateLastPiPAVPlayerVC(self.currentPlayerVC!)
    }
    
    public func updateLastPiPAVPlayerVC(_ vc: AVPlayerViewController?) {
        self.lastPlayerVC = vc
    }
    
    func playerViewController(_ playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        self.present(playerViewController, animated: true)
        completionHandler(true)
    }
    
}
