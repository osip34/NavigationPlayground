//
//  NavigationContainer.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    @ViewBuilder var content: () -> Content
    @Bindable var state: NavigationState
    let viewProvider: ViewProvider

    var body: some View {
        NavigationStack(path: $state.navigationStackPath) {
            content()
                .navigationDestination(for: Destination.self) { destination in
                    viewProvider.view(for: destination, state: state)
                }
        }
        .sheet(item: $state.presentingSheet) { sheet in
            if let modalState = state.sheetState {
                viewForModalPresentation(destination: sheet, state: modalState, viewProvider: viewProvider)
            }
        }
        .fullScreenCover(item: $state.presentingFullScreenCover) { fullScreen in
            if let modalState = state.fullScreenCoverState {
                viewForModalPresentation(destination: fullScreen, state: modalState, viewProvider: viewProvider)
            }
        }
    }
}

//MARK: - Modal Presentation Helper
@ViewBuilder func viewForModalPresentation(destination: Destination, state: NavigationState, viewProvider: ViewProvider) -> some View {
    NavigationContainer(
        content: { viewProvider.view(for: destination, state: state) },
        state: state,
        viewProvider: viewProvider
    )
}
