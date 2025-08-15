//
//  AVPlayerView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit
import AVKit

protocol myAVPlayerViewDelegate : NSObject {
	func playVideo()
}

class MyAVPlayerView : UIView {

	var pip : AVPictureInPictureController!
	var currentPlayerVC:  AVPlayerViewController?
	private(set) var lastPlayerVC: AVPlayerViewController?

	weak var delegate: myAVPlayerViewDelegate? = nil

	lazy var playButton: UIButton = {
		let button = UIButton()
		button.setTitle("Play", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(startPlayVideo), for: .touchUpInside)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupUI()
	}

	func setupUI() {
		self.addSubview(playButton)
		NSLayoutConstraint.activate([
			playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			playButton.heightAnchor.constraint(equalToConstant: 40),
			playButton.widthAnchor.constraint(equalToConstant: 140)
		])
	}

	@objc func startPlayVideo(){
		delegate?.playVideo()
	}
}
