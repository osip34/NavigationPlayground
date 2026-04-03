//
//  NavigationPlaygroundApp.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

@main
struct NavigationPlaygroundApp: App {
    let coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.RootView()
        }
    }
}
