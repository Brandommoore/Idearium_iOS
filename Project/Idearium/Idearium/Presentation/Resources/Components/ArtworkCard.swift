//
//  ArtworkCard.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct ArtworkCard: View {
    var body: some View {
		ZStack(alignment: .center){
			imageSquare(image: Image("astronaut_horse"))
			//cardDescription(prompt: "An astronaut riding a horse in mars")
		}
		.frame(width: 370, height: 438)
		.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
		.background(Color("AppBackgroundColor"))
		.padding(-19)
		
	}
}

extension ArtworkCard {
	
	func imageSquare(image: Image) -> some View {
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
			RoundedRectangle(cornerRadius: 20)
				.inset(by: 0.5)
				.stroke(.white, lineWidth: 1)
			)
	}
	
	func cardDescription(prompt: String) {
		Rectangle()
			.foregroundColor(.clear)
			.frame(width: 370, height: 81, alignment: .center)
			.background(Color("AppBackgroundColor"))
			.cornerRadius(15)
			.overlay(
				RoundedRectangle(cornerRadius: 15)
				.inset(by: 0.5)
				.stroke(.white, lineWidth: 1)
				)

	}
	
}

struct ArtworkCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCard()
		HomeView()
    }
}