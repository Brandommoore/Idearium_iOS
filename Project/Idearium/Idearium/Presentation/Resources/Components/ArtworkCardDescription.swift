//
//  ArtworkCardDescription.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct ArtworkCardDescription: View {
	
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
			Image(systemName: "heart")
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

struct ArtworkCardDescription_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkCardDescription()
    }
}
