//
//  BridgeModels.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 8/8/23.
//

import Foundation

protocol BridgeModelsProtocol {
	func transformToIdeaModel(prediction: Prediction) -> Idea?
}

class BridgeModels {
	
	// MARK: -  Needed Model
//	private var prediction: Prediction
//
//	init(prediction: Prediction) {
//		self.prediction = prediction
//	}
	
	func transformToIdeaModel(prediction: Prediction) -> Idea? {
		let idea: Idea = .init(id: "100", systemId: prediction.id,
							   prompt: prediction.inputPrompt,
							   image: prediction.output?[0],
							   status: prediction.status, isFav: false)
		return idea
	}
	
}
