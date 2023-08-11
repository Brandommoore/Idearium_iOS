//
//  RealmDB.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 9/8/23.
//

import Foundation
import RealmSwift

// Model of IdeaRealm
class IdeaRealm: Object {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted var systemId: String = ""
	@Persisted var prompt: String = ""
	@Persisted var image: String = ""
	@Persisted var status: String = ""
	@Persisted var isFav: Bool
	
	convenience init(systemId: String, prompt: String, image: String, status: String, isFav: Bool) {
		self.init()
		self.systemId = systemId
		self.prompt = prompt
		self.image = image
		self.status = status
		self.isFav = isFav
	}
}

class RealmDB {
	
	// MARK: - Params
	//let realm = try! Realm()
	
	// MARK: - Methods
	static func transformIdea_To_IdeaRealm(idea: Idea) -> IdeaRealm {
		let ideaRealm = IdeaRealm(systemId: idea.systemId!,
								  prompt: idea.prompt!,
								  image: idea.image!,
								  status: idea.status!,
								  isFav: idea.isFav!)
		return ideaRealm
	}
	
	static func transformIdeaRealm_To_Idea(ideaRealm: IdeaRealm) -> Idea {
		let idea: Idea = Idea(id: "nill",
							  systemId: ideaRealm.systemId,
							  prompt: ideaRealm.prompt,
							  image: ideaRealm.image,
							  status: ideaRealm.status,
							  isFav: ideaRealm.isFav)
		print("RealmDB IdeaTansformed --> \(idea)\n\n\n")
		return idea
	}
	
	static func transfromRealmIdeaArray_To_IdeaArray(ideaRealmArray: [IdeaRealm]) -> [Idea] {
		var ideaArray: [Idea] = []
		//print("AFTER\n\n")
		//print(ideaRealmArray)
		//print("IdeaArray --> \(ideaArray)")
		for ideaRealm in ideaRealmArray {
			var newTransIdea = transformIdeaRealm_To_Idea(ideaRealm: ideaRealm)
			//print("newTransIdea --> \(newTransIdea)\n\n\n\n")
			ideaArray.insert(newTransIdea, at: 0)
			//print("ArrayOfIdeas --> \(ideaArray)\n\n\n")
		}
		//print("\t\tBEFORE\n\n")
		print("IdeaArray RealmDB --> \(Array(ideaArray))")
		return Array(ideaArray)
	}
	
//	func saveIdeaRealm(ideaRealm: IdeaRealm) {
//		try! realm.write {
//
//		}
//	}
	
}
