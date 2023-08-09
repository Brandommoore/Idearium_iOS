//
//  IdeariumApp.swift
//  Idearium
//
//  Created by Córdoba Velicias Manuel on 2/8/23.
//

import SwiftUI

@main
struct IdeariumApp: App {
    var body: some Scene {
		//remote data source
		// repository
        WindowGroup {
			let replicateDataSource = ReplicateRemDatSourImp()
			let replicateRepository = ReplicateRepositoryImp(replicateDataSource: replicateDataSource)
            RootView()
				.environmentObject(RootViewModel(repository: replicateRepository))
			//LoadView()
        }
    }
}
