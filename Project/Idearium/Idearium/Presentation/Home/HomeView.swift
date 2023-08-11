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
	@ObservedObject var homeViewModel: HomeViewModel
	
	init(homeViewModel: HomeViewModel) {
		self.homeViewModel = homeViewModel
	}
	
	// MARK: - Vars
	let bgcol = Color("AppBackgroundColor")
	
	var body: some View {
		
		VStack(alignment: .leading, spacing: 0) {
			topBar()
			NavigationStack {
				List(homeViewModel.ideas, id: \.self){ idea in
					//ForEach(homeViewModel.ideas) { idea in
						NavigationLink {
							DetailView(idea: idea)
						} label: {
							ArtworkCard(idea: idea)
						}
						.padding(.leading, 20)
						.scrollContentBackground(.hidden)
						.background(Color("AppBackgroundColor"))
					//}
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
				print("NewArtworkButtonPulsed")
				rootViewModel.status = .newArtwork
			} label: {
				Image(systemName: "plus.square")
					.resizable()
					.frame(width: 30, height: 30)
					.padding(.leading, 40)
					.padding(.bottom, 5)
					.foregroundColor(.white)
			}
		}
	}
}

//struct HomeView_Previews: PreviewProvider {
//	static var previews: some View {
//		HomeView()
//	}
//}
