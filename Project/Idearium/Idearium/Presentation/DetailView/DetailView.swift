//
//  DetailView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 3/8/23.
//

import SwiftUI

struct DetailView: View {
	
	// MARK: - States
	@State var isFav: Bool = false
	
	// MARK: Vars
	var idea: Idea
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
	
	// Main image component of detail view
	func imageDetailView(image: Image) -> some View {
		ZStack(alignment: .top) {
			// Image component
			VStack(alignment: .leading){
				image
					.resizable()
					.scaledToFill()
			}
			ZStack {
				// NavigationBar
				HStack {
					returnButton()
					Spacer().frame(width: windowWidth - 110)
					heartIconButton(istrue: false)
						.padding(.top, 60)
						.padding(.trailing)
				}
			}
		}
		.edgesIgnoringSafeArea(.all)
		.background(.red)
		.frame(maxWidth: .infinity)
		.frame(height: 600)
	}
	
	// Text labels of the DetailView
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
	
	// Return button of topNavigationBar
	func returnButton() -> some View {
		Button{
			print("Return button pulsed")
		} label: {
			Image(systemName: "arrowtriangle.left.fill")
				.resizable()
				.frame(width: 25, height: 25)
				.foregroundColor(.white)
				.padding(.top, 70) 	// This is the top margin of all button bar
				.padding(.leading)
		}
	}
	
	// Button icon if is fav
	func heartIconButton(istrue: Bool) -> some View {
		let scaleFavIcon: CGFloat = CGFloat(25)

		return Button {
			print("Fav button tapped")
			print("FavButtoState --> \(isFav)")
			isFav.toggle()
		} label: {
			Image(systemName: isFav ? "heart.fill" : "heart")
				.resizable()
				.frame(width: scaleFavIcon + 2.0, height: scaleFavIcon)
				.foregroundColor(isFav ? (.red) : Color(.white))
		}
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(idea: .init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false))
    }
}
