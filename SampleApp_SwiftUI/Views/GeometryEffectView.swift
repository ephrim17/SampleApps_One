//
//  GeometryEffectView.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 29/01/25.
//

import SwiftUI

struct MatchedGeometryDemo: View {
	@Namespace var animation
	@State var detailViewName: String? = nil

	var body: some View {
		ZStack {
			if (detailViewName == nil) {
				RootView(animation: animation, detailViewName: $detailViewName)
			} else {
				DetailView(detailViewName: $detailViewName, animation: animation)
			}
		}

	}
}

fileprivate struct DetailView: View {
	@Binding var detailViewName: String?
	var animation: Namespace.ID

	var body: some View {
		VStack {
			Text( "\(detailViewName ?? "")")
				.matchedGeometryEffect(id: "title", in: animation)
				.font(.title3.bold())
				.foregroundStyle(Color.white)

			Spacer()
				.frame(height: 50)

			Button(action: {
				withAnimation {
					detailViewName = nil
				}
			}, label: {
				Text( "Back")
					.font(.title3.bold())
					.foregroundStyle(Color.red)
			})
			.foregroundStyle(Color.red)
			.padding(.all, 8)
			.background(
				RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
					.fill(Color.white)
			)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
		.padding(.all, 20)
		.background(
			Color(UIColor.red)
				.matchedGeometryEffect(id: "background", in: animation)
				.ignoresSafeArea(.all)
		)
	}
}


fileprivate struct RootView: View {
	var animation: Namespace.ID
	@Binding var detailViewName: String?

	var body: some View {
		VStack {
			Button(action: {
				withAnimation {
					detailViewName = "Detail 1"
				}
			}, label: {
				Text( "Detail 1")
					.matchedGeometryEffect(id: "title", in: animation)
					.font(.title3.bold())
					.foregroundStyle(Color.white)
			})
			.foregroundStyle(Color.white)
			.padding(.all, 8)
			.background(
				RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
					.fill(Color.green.opacity(0.8))
			)

			Button(action: {
				withAnimation {
					detailViewName = "Detail 2"
				}
			}, label: {
				Text( "Detail 2")
					.font(.title3.bold())
					.foregroundStyle(Color.white)
			})
			.foregroundStyle(Color.white)
			.padding(.all, 8)
			.background(
				RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
					.fill(Color.blue.opacity(0.8))
					.matchedGeometryEffect(id: "background", in: animation)
			)
		}
	}
}
