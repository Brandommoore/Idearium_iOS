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
				.frame(maxWidth: 227, alignment: .leading)
				.background(Color("red"))
			Divider().frame(width: 20, height: 0)
			//Spacer().frame(width: 10)
			//heartIconButton()
			heartIcon(isFav: false)			// Changue on ViewModel
		}
		.multilineTextAlignment(.leading)
		.lineLimit(1)
		.padding([.bottom, .top], 20)
		.padding([.leading, .trailing], 24)
		.foregroundColor(.white)
		.background(Color("AppBackgroundColor"))
		.cornerRadius(15)
    }
}

extension ArtworkCardDescription {
	
	func heartIcon(isFav: Bool) -> some View {
		Image(systemName: isFav ? "heart.fill" : "heart")
			.resizable()
			.frame(width: 24, height: 22)
			.foregroundColor(isFav ? Color(.red) : Color(.white))
	}
	
}

struct ArtworkCardDescription_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCardDescription()
		ArtworkCard(idea: .init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false))
    }
}
