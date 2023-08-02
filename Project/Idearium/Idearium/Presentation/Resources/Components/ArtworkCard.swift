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
			
			imageSquare(image: Image("astronaut_horse"), prompt: "An astronaut mars")
			//cardDescription(prompt: "An astronaut riding a horse in mars")
			
		}
		.frame(width: 370, height: 438)
		.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
		.background(Color("AppBackgroundColor"))
		.padding(-19)
	}
}

extension ArtworkCard {

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
				//cardDescription(prompt: "Astronaut").frame(alignment: .bottom)
			)
			.overlay(
				cardDescription(prompt: prompt).frame(alignment: .leading)
			)
	}
	
//	func cardDescription(prompt: String) -> some View {
//		HStack() {
//			Text(prompt)
//				.multilineTextAlignment(.leading)
//				//.frame(width: 260)
//				.frame(maxWidth: 260, alignment: .leading)
//				.background(Color("red"))
//			Divider().frame(width: 20, height: 0)
//			//Spacer().frame(width: 10)
//			Image(systemName: "heart")
//		}
//		.multilineTextAlignment(.leading)
//		.lineLimit(1)
//		.padding([.bottom, .top], 13)
//		.padding([.leading, .trailing], 20)
//		.foregroundColor(.white)
//		.background(Color("AppBackgroundColor"))
//		//.frame(alignment: .leading)
//		.cornerRadius(15)

//		Rectangle()
//			.foregroundColor(.clear)
//			.frame(width: 370, height: 81, alignment: .center)
//			.background(Color("AppBackgroundColor"))
//			.cornerRadius(15)
//			.overlay(
//				RoundedRectangle(cornerRadius: 15)
//				.inset(by: 0.5)
//				.stroke(.white, lineWidth: 1)
//			).frame(alignment: .bottom)
//	}
	
	
}

struct ArtworkCard_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCard()
		HomeView()
    }
}
