//
//  LoadView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import SwiftUI
import Lottie

struct LoadView: View {
    var body: some View {
		ZStack(alignment: .center) {
			LottieView(loopMode: .loop)
		}
		.background(Color("AppBackgroundColor"))
    }
}

struct LottieView: UIViewRepresentable {
	let loopMode: LottieLoopMode

	func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
		
	}
	
	func makeUIView(context: Context) -> Lottie.LottieAnimationView {
		let animationView = LottieAnimationView(name: "LottieLoadGenAnimation")
		animationView.play()
		animationView.loopMode = loopMode
		animationView.contentMode = .scaleAspectFit
		return animationView
	}
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
