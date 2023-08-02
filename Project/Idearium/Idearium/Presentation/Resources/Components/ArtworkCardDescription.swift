//
//  ArtworkCardDescription.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct ArtworkCardDescription: View {
	
	@State var isFav: Bool = false
	var prompt: String
	
	init(prompt: String = "undefined") {
		self.prompt = prompt
	}
	
    var body: some View {
		HStack() {
			Text(prompt)
				.multilineTextAlignment(.leading)
				//.frame(width: 260)
				.frame(maxWidth: 260, alignment: .leading)
				.background(Color("red"))
			Divider().frame(width: 20, height: 0)
			//Spacer().frame(width: 10)
			heartIconButton()
		}
		.multilineTextAlignment(.leading)
		.lineLimit(1)
		.padding([.bottom, .top], 20)
		.padding([.leading, .trailing], 24)
		.foregroundColor(.white)
		.background(Color("AppBackgroundColor"))
		//.frame(alignment: .leading)
		.cornerRadius(15)
    }
}

extension ArtworkCardDescription {
	
	func heartIconButton() -> some View {
		let scaleFavIcon: CGFloat = CGFloat(22)
		
		return Button {
			print("Fav button tapped")
			isFav.toggle()
		} label: {
			Image(systemName: isFav ? "heart.fill" : "heart")
				.resizable()
				.frame(width: scaleFavIcon + 2.0, height: scaleFavIcon)
				.foregroundColor(isFav ? .red : .white)
		}
	}
	
}

struct ArtworkCardDescription_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCardDescription()
		ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
    }
}
