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
		
		NavigationStack {
			List {
				ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
				ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
				ArtworkCard(image: Image("astronaut_horse"), prompt: "An astronaut riding a horse on Mars")
			}
			.scrollIndicators(.hidden)
			.padding(10)
			.ignoresSafeArea(.all)
			.listRowSeparatorTint(bgcol)
			.scrollContentBackground(.hidden)
			.background(bgcol)
			
		}
		.ignoresSafeArea(.all)
		.scrollContentBackground(.hidden)
		.preferredColorScheme(.dark)
	}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
