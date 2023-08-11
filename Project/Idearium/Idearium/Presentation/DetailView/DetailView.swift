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
	@EnvironmentObject var rootViewModel: RootViewModel
	
	// To dismiss navigationLink
	@Environment(\.dismiss) private var dismiss
	
	// MARK: Vars
	var idea: Idea
	var windowWidth = UIScreen.main.bounds.size.width
	
    var body: some View {
		VStack(alignment: .leading) {
			imageDetailView(image: idea.image!)
			Spacer().frame(height: 30)
			VStack(alignment: .leading, spacing: 20){
				textLabelComponent(title: "ID", description: idea.systemId!)
				textLabelComponent(title: "PROMT", description: idea.prompt!, promptType: true)
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
		.navigationBarBackButtonHidden(true)
	}
}

extension DetailView {
	
	// Main image component of detail view
	func imageDetailView(image: String) -> some View {
		ZStack(alignment: .top) {
			// Image component
			VStack(alignment: .leading){
				AsyncImage(url: getUrlFromString(imageURLString: image),
						   content: { image in
					image.resizable()
						.aspectRatio(contentMode: .fill)
				}, placeholder: {
					LoadView()
				})
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
	
	// Return button of NaviationLink
	func returnButton() -> some View {
		Button{
			print("DetailView button pulsed")
			dismiss()
			rootViewModel.status = .home
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
//			changueFavStatus(isFav: isFav!)
		} label: {
			Image(systemName: isFav ? "heart.fill" : "heart")
				.resizable()
				.frame(width: scaleFavIcon + 2.0, height: scaleFavIcon)
				.foregroundColor(isFav ? (.red) : Color(.white))
		}
	}
	
	func getUrlFromString(imageURLString: String) -> URL? {
		guard let downImageURL: URL = URL(string: imageURLString) else {
			return nil
		}
		return downImageURL
	}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
		DetailView(idea: .init(systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false))
    }
}
