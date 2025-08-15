//
//  VideoPlayerView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
	@State private var showingModal = false
	@Environment(\.dismiss) var dismiss

	var body: some View {
		VStack {
			Button("play video") {
				showingModal.toggle()
			}
			.sheet(isPresented: $showingModal) {
				ModalPlayerView()
					.frame(alignment: .center)
			}
		}
	}
}

struct ModalPlayerContainerView: View {
	@Environment(\.dismiss) var dismiss
	@State private var showingModal = false

	var body: some View {
		VStack(alignment: .center) {
			PlayerView()
				.frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
		}
	}
}

struct MyVideoPlayer: UIViewControllerRepresentable {
	var player: AVPlayer

	func makeUIViewController(context: Context) -> AVPlayerViewController {
		let controller = AVPlayerViewController()
		controller.player = player
		return controller
	}

	func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
		uiViewController.player = player
	}
}

struct PlayerView: View {
	@State private var player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "Apple", withExtension: "mp4")!)

	var body: some View {
		MyVideoPlayer(player: player)
			.onAppear {
				player.play()
			}
			.onDisappear {
				player.pause()
			}
	}
}



struct XMarkButton: View {
	var action: () -> Void

	var body: some View {
		Button(action: {
			action()
		}, label: {
			Image(systemName: "xmark")
				.font(.headline)
		})
	}
}

struct ModalPlayerView: View {
	@Environment(\.dismiss) private var dismiss

	var body: some View {
		NavigationView {
			VStack {
				PlayerView()
					.frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
			}
			.navigationTitle("Player View")
			.toolbar(content: {
				ToolbarItem(placement: .navigationBarLeading) {
					XMarkButton {
						dismiss()
					}
				}
			})
		}
	}
}
