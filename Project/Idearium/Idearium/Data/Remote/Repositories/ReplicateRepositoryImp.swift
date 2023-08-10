//
//  ReplicateRepositoryImp.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 9/8/23.
//

import Foundation
import RealmSwift

class ReplicateRepositoryImp: ReplicateRepositoryProtocol {
	
	// MARK: - Properties
	//@EnvironmentObject var rootViewModel: RootViewModel
	private let replicateDataSource: ReplicateRemDatSourImp
	//private let bridgeModels = BridgeModels(prediction)
	private let realm = try! Realm()
	private let realmDB = RealmDB()
	
	init(replicateDataSource: ReplicateRemDatSourImp) {
		self.replicateDataSource = replicateDataSource
	}
	
	// MARK: - Vars
	//private let prediction: Prediction?
	
//	func getFinalPrediction(prompt: String) async throws -> Prediction {
//		let prediction = try? await replicateDataSource.getFinalPrediction(prompt: prompt)
//		return prediction!
//	}
	
	func createIdea(prompt: String, completion: @escaping (Idea) -> ()) async throws {
		let prediction = try? await replicateDataSource.getFinalPrediction(prompt: prompt)
		let idea = transformToIdeaModel(prediction: prediction!)
		completion(idea!)
		// En este momento hay que pasar a una detailView y pasar la Idea
		let ideaRealm = realmDB.transformIdeaToIdeaRealm(idea: idea!)
		DispatchQueue.main.async {
			self.saveIdea(ideaRealm: ideaRealm)
		}
	}
	
	func saveIdea(ideaRealm: IdeaRealm) {
		try! realm.write {
			realm.add(ideaRealm)
		}
	}
	
	func readAllIdeas(isFav: Bool) -> [IdeaRealm]? {
		let allIdeas = realm.objects(IdeaRealm.self)
		if (isFav == false) {
			return Array(allIdeas)
		} else {
			let allIdeasFav = allIdeas.where {
				$0.isFav == true
			}
			return Array(allIdeasFav)
		}
	}
	
	//func

}


extension ReplicateRepositoryImp {
	
	// MARK: - Util Extensions
	
	func transformToIdeaModel(prediction: Prediction) -> Idea? {
		let idea: Idea = .init(id: "100", systemId: prediction.id,
							   prompt: prediction.inputPrompt,
							   image: prediction.output?[0],
							   status: prediction.status, isFav: false)
		return idea
	}
}
