//
//  ReplicateRepositoryProtocol.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 8/8/23.
//

import Foundation

protocol ReplicateRepositoryProtocol {
	func createIdea(prompt: String, completion: @escaping (Idea) -> ()) async throws
	func readAllIdeas(isFav: Bool) -> [IdeaRealm]?
}
