//
//  HomeViewModel.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 8/8/23.
//

import Foundation

final class HomeViewModel: ObservableObject {
	
	// MARK: - Properties
	private let repository: ReplicateRepositoryProtocol
	var ideas: [Idea] = []
	var ideasRealm: [IdeaRealm] = []
	
	// MARK: - Mock
	let ideasMock: [Idea] = [
		.init(id: "0", systemId: "hfsudf", prompt: "Astronaut riding a horse on mars, hd", image: "https://replicate.delivery/pbxt/sWeZFZou6v3CPKuoJbqX46ugPaHT1DcsWYx0srPmGrMOCPYIA/out-0.png", status: "completed", isFav: false),
		.init(id: "1", systemId: "7fsh23", prompt: "Queen cat with a gold crown in the head", image: "https://replicate.delivery/pbxt/aooDunhAPcbUBh979fEblu4qqohEtlG0dPJUf1aLuUkMowCQA/out-0.png", status: "completed", isFav: false),
		.init(id: "2", systemId: "9fb273", prompt: "Apainting on canvas of a landscape with some sunflowers and clouds in the background", image: "https://replicate.com/api/models/stability-ai/stable-diffusion/files/0d5e6ce0-dd85-4dd8-a087-a9c59876b456/out-0.png", status: "completed", isFav: false)
	]
	
	init(repository: ReplicateRepositoryProtocol) {
		self.repository = repository
		self.ideas = ideasMock
		DispatchQueue.main.async {
			let ideasRealm = repository.readAllIdeas(isFav: false)!
			var ideaArray: [Idea] = []
			self.ideasRealm = ideasRealm
			
			for idea in ideasRealm {
				ideaArray.append(Idea(id: "nill",
									  systemId: idea.systemId,
									  prompt: idea.prompt,
									  image: idea.image,
									  status: idea.status,
									  isFav: idea.isFav))
			}
			print("ideaArray View --> \(ideaArray)")
			self.ideas = ideaArray
			//print("HomeviewModel ideasrealm --> \(ideasRealm)")
			//self.ideas = RealmDB.transfromRealmIdeaArray_To_IdeaArray(ideaRealmArray: ideasRealm)
			//print("Array Ideas HVM --> \(self.ideas)")
			print("imageIdea/Viewmodel --> \(self.ideas[0].image)")
		}
		
		//print(self.ideas)
	}
	
	
	
}

