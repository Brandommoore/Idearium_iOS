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
			imageSquare(image: Image(idea.image ?? "xmark.rectangle.fill"),
						prompt: idea.prompt ?? "nill")
		}
		.frame(width: 338, height: 348)
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
			.frame(width: 338, height: 340)
			.background(
				AsyncImage(url: getUrlFromString(imageURLString: idea.image!),
						   content: { image in
					image.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: 370, height: 380)
						.clipped()
				}, placeholder: {
					LoadView()
				})
			)
			.cornerRadius(20)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
				.inset(by: 0.5)
				.stroke(.white, lineWidth: 1)
			)
			.overlay(
				ArtworkCardDescription(prompt: prompt)
					.position(.init(x: 338/2, y: 308))
			)
	}
	
	func getUrlFromString(imageURLString: String) -> URL? {
		guard let downImageURL: URL = URL(string: imageURLString) else {
			return nil
		}
		return downImageURL
	}
}

struct ArtworkCard_Previews: PreviewProvider {
    static var previews: some View {
		ArtworkCard(idea: .init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false))
		HomeView()
    }
}
