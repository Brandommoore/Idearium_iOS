//
//  RealmDB.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 9/8/23.
//

import Foundation
import RealmSwift

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
	let realm = try! Realm()
	
	// MARK: - Methods
	func transformIdeaToIdeaRealm(idea: Idea) -> IdeaRealm {
		let ideaRealm = IdeaRealm(systemId: idea.systemId!,
								  prompt: idea.prompt!,
								  image: idea.image!,
								  status: idea.status!,
								  isFav: idea.isFav!)
		return ideaRealm
	}
	
//	func saveIdeaRealm(ideaRealm: IdeaRealm) {
//		try! realm.write {
//
//		}
//	}
	
}
