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
			NewArtworkView(newArtworkViewModel: NewArtworkViewModel(replicateRepository: rootViewModel.repository))
		case .detail(let idea):
			DetailView(idea: idea)
			//LoadView()
		}
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
		let replicateDataSource = ReplicateRemDatSourImp()
		let replicateRepository = ReplicateRepositoryImp(replicateDataSource: replicateDataSource)
		RootView()
			.environmentObject(RootViewModel(repository: replicateRepository))
    }
}
