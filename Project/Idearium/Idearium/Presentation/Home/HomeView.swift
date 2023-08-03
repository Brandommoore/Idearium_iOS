//
//  HomeView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		
		// MARK: - Vars
		let bgcol = Color("AppBackgroundColor")
		
		VStack(alignment: .leading, spacing: 0) {
			Image("Idearium_text")
				.resizable()
				.frame(width: 163 * 0.75, height: 30 * 0.75)
				.padding([.leading, .trailing], 35)
				.padding(.top, 10)
				.padding(.bottom, 20)
				.background(bgcol)
			NavigationStack {
				List {
					ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
					ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
					ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
				}
				.scrollIndicators(.hidden)
				.padding([.leading, .trailing], 10)
				.padding(.top, -30)
				.ignoresSafeArea(.all)
				.listRowSeparatorTint(bgcol)
				.scrollContentBackground(.hidden)
				.background(bgcol)
			}
			.ignoresSafeArea(.all)
			.scrollContentBackground(.hidden)
			.preferredColorScheme(.dark)
			.background(bgcol)
		}
		.background(bgcol)
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
