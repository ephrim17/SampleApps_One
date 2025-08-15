//
//  videoLoop.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 19/02/25.
//

import UIKit
import AVFoundation

class VideoLoopView: UIView {
    typealias OnPlayBlock = () -> ()
    
    var onPlay: OnPlayBlock? = nil
    
    fileprivate var player: AVQueuePlayer?
    fileprivate var playerLooper: AVPlayerLooper?
    fileprivate var playerLayer: AVPlayerLayer?
    fileprivate var observerContext = 0
    fileprivate static let dataParseQueue = DispatchQueue.global(qos: .utility)
    fileprivate var wantsToPlay: Bool = false
    
    var resourceName: String = ""
    
    init(named: String) {
        resourceName = named
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        if let url = Bundle.main.url(forResource: resourceName, withExtension: ".mp4") {
            self.loadFrom(url: url)
        }
    }
    
    deinit {
        self.player?.removeObserver(self, forKeyPath: "status", context: &observerContext)
    }
}


extension VideoLoopView {

    fileprivate func loadFrom(url: URL) {
        self.player?.pause()
        self.playerLayer?.removeFromSuperlayer()

        self.player = nil
        self.playerLayer = nil

        let asset = AVAsset(url: url)
        let item = AVPlayerItem(asset: asset)
        let player = AVQueuePlayer(items: [item])
        self.player = player

        self.playerLooper = AVPlayerLooper(player: player, templateItem: item)

        player.addObserver(
            self,
            forKeyPath: "status",
            options: .new,
            context: &self.observerContext
        )

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize
        self.playerLayer = playerLayer
        player.seek(to: CMTime.zero)
        playerLayer.frame = self.layer.bounds
        self.layer.insertSublayer(playerLayer, at: 0)
        player.actionAtItemEnd = .none

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playerItemDidReachEnd(notification:)),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )
    }

    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero)
        }
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer?.frame = self.bounds
        self.playerLayer?.videoGravity = .resize
    }

    public func play(andThen: OnPlayBlock? = nil) {
        self.wantsToPlay = true

        guard let player = player else {
            if andThen != nil {
                onPlay = andThen
            }
            return
        }

        switch player.status {
        case .readyToPlay:
            player.play()
            onPlay?()
            onPlay = nil
        case .failed:
            return
        case .unknown:
            return
        }
    }

    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &observerContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }

        if (wantsToPlay && keyPath == "status") {
            if let newValue = change![.newKey] as? Int, AVPlayer.Status(rawValue: newValue) == AVPlayer.Status.readyToPlay {
                self.play()
            }
        }
    }
}
