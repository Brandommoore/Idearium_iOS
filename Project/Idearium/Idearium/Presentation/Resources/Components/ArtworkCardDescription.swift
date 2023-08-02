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
			//Image(systemName: "heart")
		}
		.multilineTextAlignment(.leading)
		.lineLimit(1)
		.padding([.bottom, .top], 13)
		.padding([.leading, .trailing], 20)
		.foregroundColor(.white)
		.background(Color("AppBackgroundColor"))
		//.frame(alignment: .leading)
		.cornerRadius(15)
    }
}

extension ArtworkCardDescription {
	
	func heartIconButton() -> some View {
		Button {
			print("Fav button tapped")
			isFav.toggle()
		} label: {
			Image(systemName: isFav ? "heart.fill" : "heart")
				.foregroundColor(isFav ? .red : .white)
		}
	}
	
}

struct ArtworkCardDescription_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCardDescription()
    }
}
