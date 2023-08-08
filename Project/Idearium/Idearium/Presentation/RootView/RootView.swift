//
//  RootView.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 4/8/23.
//

import SwiftUI

struct RootView: View {
	
	//MARK: - Properties
	@EnvironmentObject var rootViewModel: RootViewModel
		
    var body: some View {
		switch (rootViewModel.status) {
		case .splash:
			SplashScreen()
		case .home:
			HomeView()
		case .loadingHome:
			LoadView()
		case .loadingPrediction:
			LoadView()
		case .newArtwork:
			NewArtworkView()
		case .completed(prediction: let prediction):
			//DetailView(idea: Idea)
			LoadView()
		}
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
			.environmentObject(RootViewModel())
    }
}
