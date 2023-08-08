//
//  RootViewModel.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 4/8/23.
//

import Foundation

enum Status {
	case splash
	case home
	case newArtwork
	case loadingHome
	case loadingPrediction
	case completed(prediction: Prediction)
}

final class RootViewModel: ObservableObject {
	
	//MARK: - Properties
	@Published var status = Status.splash
	
}
