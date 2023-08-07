//
//  HomeView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		
		// MARK: - Mock
		let ideasMock: [Idea] = [
			.init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "astronaut_horse", status: "completed", isFav: false),
			.init(id: "1", systemId: "7fsh23", prompt: "Queen cat with a gold crown in the head", image: "cat_idea", status: "completed", isFav: false),
			.init(id: "2", systemId: "9fb273", prompt: "Apainting on canvas of a landscape with some sunflowers and clouds in the background", image: "sunflower_idea", status: "completed", isFav: false)
		]
		
		// MARK: - Vars
		let bgcol = Color("AppBackgroundColor")
		//var windowWidth = UIScreen.main.bounds.size.width
		//var windowHeight = UIScreen.main.bounds.size.height
		
		VStack(alignment: .leading, spacing: 0) {
			topBar()
			NavigationStack {
				List(ideasMock, id: \.self) { idea in
					NavigationLink {
						DetailView(idea: idea)
					} label: {
						ArtworkCard(idea: idea)
					}
					.padding(.leading, 20)
					.scrollContentBackground(.hidden)
					.background(Color("AppBackgroundColor"))
				}
				.scrollIndicators(.hidden)
				.padding([.leading, .trailing], 9)
				.padding(.top, -30)
				.ignoresSafeArea(.all)
				.listRowSeparatorTint(Color("AppBackgroundColor"))
				.scrollContentBackground(.hidden)
				.background(Color("AppBackgroundColor"))
			}
			.ignoresSafeArea(.all)
			.scrollContentBackground(.hidden)
			.preferredColorScheme(.dark)
			.background(bgcol)
		}
		.background(bgcol)
	}
}

extension HomeView {
	
	func topBar() -> some View {
		HStack(spacing: 140) {
			Image("Idearium_text")
				.resizable()
				.frame(width: 163 * 0.75, height: 30 * 0.75)
				.padding([.leading, .trailing], 35)
				.padding(.top, 10)
				.padding(.bottom, 20)
				.background(Color("AppBackgroundColor"))
			Button {
				NewArtworkView()
			} label: {
				Image(systemName: "plus.square")
					.resizable()
					.frame(width: 30, height: 30)
					.padding(.leading, 40)
					.foregroundColor(.white)
			}
		}
	}
	
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
