//
//  NavigationContainer.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    @Bindable var state: NavigationState
    let router: AppCoordinator
    @ViewBuilder var content: () -> Content

    init(
        @ViewBuilder content: @escaping () -> Content,
        router: AppCoordinator,
        state: NavigationState
    ) {
        self.state = state
        self.router = router
        self.content = content
    }

    var body: some View {
        NavigationStack(path: $state.navigationStackPath) {
            content()
                .navigationDestination(for: Destination.self) { destination in
                    router.view(for: destination, state: state)
                }
        }
        .sheet(item: $state.presentingSheet) { sheet in
            let modalState = router.modalStates[sheet.id] ?? NavigationState()
            viewForModalPresentation(destination: sheet, state: modalState, router: router)
        }
        .fullScreenCover(item: $state.presentingFullScreenCover) { fullScreen in
            let modalState = router.modalStates[fullScreen.id] ?? NavigationState()
            viewForModalPresentation(destination: fullScreen, state: modalState, router: router)
        }
    }
}

@ViewBuilder func viewForModalPresentation(destination:Destination, state: NavigationState, router: AppCoordinator) -> some View {
    NavigationContainer(
        content: { router.view(for: destination, state: state) },
        router: router,
        state: state
    )
}

