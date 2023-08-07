//
//  ArtworkCard.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct ArtworkCard: View {
	
	// MARK: - States

	// MARK: - Vars
	var idea: Idea
	//private let image: Image
	//private let prompt: String
	
//	init(image: Image, prompt: String) {
//		self.image = image
//		self.prompt = prompt
//	}
	
    var body: some View {
		ZStack(alignment: .center){
			imageSquare(image: Image(idea.image), prompt: idea.prompt)
		}
		.frame(width: 370, height: 438)
		.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
		.background(Color("AppBackgroundColor"))
		.padding(-19)
	}
}

extension ArtworkCard {

	// Is the main part of the component. The part of stroke, shadow
	// and image. Its overlayed by ArtworkCardDescription
	func imageSquare(image: Image, prompt: String) -> some View {
		Rectangle()
			.foregroundColor(.clear)
			.frame(width: 370, height: 380)
			.background(
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 370, height: 380)
					.clipped()
			)
			.cornerRadius(20)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
				.inset(by: 0.5)
				.stroke(.white, lineWidth: 1)
			)
			.overlay(
				ArtworkCardDescription(prompt: prompt)
					.position(.init(x: 370/2, y: 348))
			)
	}
}

struct ArtworkCard_Previews: PreviewProvider {
    static var previews: some View {
		ArtworkCard(idea: .init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false))
		HomeView()
    }
}
