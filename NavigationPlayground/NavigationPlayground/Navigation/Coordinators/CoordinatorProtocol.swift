//
//  Coordinator.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 08.04.2026.
//

import SwiftUI

protocol Coordinator {
    var rootState: NavigationState { get set }
    
    func RootView() -> AnyView
}

protocol ViewProvider {
    // It's fine to use AnyView here. These views won't be updating in NavigationContainer.
    // We just push and present them, so this should not affect performance.
    func view(for destination: Destination, state: NavigationState) -> AnyView
}
