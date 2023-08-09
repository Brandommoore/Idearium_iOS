//
//  HomeView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct HomeView: View {
	
	// MARK: - Properties
	@EnvironmentObject var rootViewModel: RootViewModel
	var windowWidth = UIScreen.main.bounds.size.width
	var windowHeight = UIScreen.main.bounds.size.height
	//@ObservedObject var homeViewModel: HomeViewModel
	
//	init(homeViewModel: HomeViewModel) {
//		self.homeViewModel
//	}
	
	// MARK: - Mock
	let ideasMock: [Idea] = [
		.init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "https://replicate.delivery/pbxt/sWeZFZou6v3CPKuoJbqX46ugPaHT1DcsWYx0srPmGrMOCPYIA/out-0.png", status: "completed", isFav: false),
		.init(id: "1", systemId: "7fsh23", prompt: "Queen cat with a gold crown in the head", image: "cat_idea", status: "completed", isFav: false),
		.init(id: "2", systemId: "9fb273", prompt: "Apainting on canvas of a landscape with some sunflowers and clouds in the background", image: "sunflower_idea", status: "completed", isFav: false)
	]
	
	// MARK: - Vars
	let bgcol = Color("AppBackgroundColor")
	
	var body: some View {
		
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
					.padding(.bottom, 20)
					.padding(.top, 10)
					.scrollContentBackground(.hidden)
					.background(Color("AppBackgroundColor"))
				}
				.scrollIndicators(.hidden)
				.padding([.leading, .trailing], 9)
				.padding(.top, -20)
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
		HStack(spacing: 0) {
			Image("Idearium_text")
				.resizable()
				.frame(width: 163 * 0.75, height: 30 * 0.75)
				.padding([.leading, .trailing], 35)
				.padding(.top, 20)
				.padding(.bottom, 30)
				.background(Color("AppBackgroundColor"))
			Spacer()
			Button {
				print("NewArtworkButtonPulsed")
				rootViewModel.status = .newArtwork
			} label: {
				Image(systemName: "plus.square")
					.resizable()
					.frame(width: 30, height: 30)
					.padding(.leading, 0)
					.padding(.trailing, 30)
					.padding(.bottom, 5)
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
