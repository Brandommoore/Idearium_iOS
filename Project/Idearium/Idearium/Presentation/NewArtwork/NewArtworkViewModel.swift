//
//  NewArtworkModel.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 7/8/23.
//

import Foundation

final class NewArtworkViewModel: ObservableObject {
	
	// MARK: - Properties
	private var idea: Idea?
	//private var prompt: String = ""
	private let replicateRepository: ReplicateRepositoryImp
	
	init(replicateRepository: ReplicateRepositoryImp) {
		self.replicateRepository = replicateRepository
	}
	
	func onNewArtworkButtonPulsed(prompt: String, completion: @escaping (Idea) -> ()) async throws {
		print("NewArtwork with prompt: \(prompt) in ViewModel")
		try await replicateRepository.createIdea(prompt: prompt, completion: completion)
	}
}
