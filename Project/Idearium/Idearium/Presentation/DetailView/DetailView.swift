//
//  DetailView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 3/8/23.
//

import SwiftUI

struct DetailView: View {
	
	// Vars
	var windowWidth = UIScreen.main.bounds.size.width
	
    var body: some View {
		VStack(alignment: .leading) {
			imageDetailView(image: Image("astronaut_horse"))
			Spacer().frame(height: 30)
			VStack(alignment: .leading, spacing: 20){
				textLabelComponent(title: "ID", description: "f6320fdv2v0fd2837vf")
				textLabelComponent(title: "PROMT", description: "An astronaut riding a white horse in mars, whit a realistic style", promptType: true)
			}
			.multilineTextAlignment(.leading)
			.padding(.leading)
			.frame(maxWidth: .infinity)
			Spacer()
		}
		.ignoresSafeArea(.all)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("AppBackgroundColor"))
		.preferredColorScheme(.dark)
	}
}

extension DetailView {
	
	func imageDetailView(image: Image) -> some View {
		ZStack(alignment: .top) {
			VStack(alignment: .leading){
				image
					.resizable()
					.scaledToFill()
			}
			ZStack {
				HStack {
					Button{
						print("Return button pulsed")
					} label: {
						Image(systemName: "arrowtriangle.left.fill")
							.resizable()
							.frame(width: 25, height: 25)
							.foregroundColor(.white)
							.padding(.top, 60)
					}
					Spacer().frame(width: windowWidth - 80)
				}
			}
		}
		.edgesIgnoringSafeArea(.all)
		.background(.red)
		.frame(maxWidth: .infinity)
		.frame(height: 600)
	}
	
	func textLabelComponent(title: String, description: String, promptType: Bool = false) -> some View {
		VStack(alignment: .leading, spacing: 5) {
			Text(title)
				.fontWeight(.bold)
			Divider()
				.frame(width: 100, height: 2)
				.background(Color(.white))
			switch promptType {
			case true:
				Text(description)
					.multilineTextAlignment(.leading)
					.fontWeight(.light)
					.padding(.top, -130/2)
					.padding(.leading, -15)
					.frame(width: 380, height: 130)
			default:
				Text(description)
					.multilineTextAlignment(.leading)
					.fontWeight(.light)
			}
		}.multilineTextAlignment(.leading)
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
