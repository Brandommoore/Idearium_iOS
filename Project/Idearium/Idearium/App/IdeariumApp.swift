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
        WindowGroup {
            RootView()
				.environmentObject(RootViewModel())
        }
    }
}
