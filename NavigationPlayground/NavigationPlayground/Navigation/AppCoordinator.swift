//
//  AppCoordinator.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import Foundation
import SwiftUI

@Observable
class AppCoordinator {
    var rootState = NavigationState()
    var modalStates: [String: NavigationState] = [:]
    
    private let viewFactory: ViewFactory
    
    init(viewFactory: ViewFactory = DefaultViewFactory()) {
        self.viewFactory = viewFactory
    }
    
    @ViewBuilder func view(for destination: Destination, state: NavigationState) -> some View {
        switch destination {
        case .home:
            viewFactory.makeView1(
                onNavigate: { [weak self] in self?.navigateToDetails(state: state) },
                onClose: { [weak self] in self?.backToRoot(state: state) }
            )
        case .details:
            viewFactory.makeView2(
                onNavigate: { [weak self] in self?.navigateToFirstCover(state: state) },
                onClose: { [weak self] in self?.backToRoot(state: state) }
            )
        case .firstCover:
            viewFactory.makeView3(
                onNavigate: {},
                onClose: { [weak self] in self?.backToRoot(state: state) }
            )
        }
    }
    
    func RootView() -> some View {
        NavigationContainer(
            content: { ContentView(onTap: { [weak self] in
                self?.navigateToFirstView()
            }) },
            router: self,
            state: rootState)
    }
    
    func navigateToFirstView() {
        rootState.navigationStackPath.append(.home)
    }
    
    func navigateToDetails(state: NavigationState) {
        state.navigationStackPath.append(.details)
    }
    
    func navigateToFirstCover(state: NavigationState) {
        let modalState = NavigationState()
        modalState.navigationStackPath = [.firstCover]
        modalStates["firstCover"] = modalState
        state.presentingFullScreenCover = .firstCover
    }
    
    func backToRoot(state: NavigationState) {
        state.navigationStackPath.removeAll()
        state.presentingSheet = nil
        state.presentingFullScreenCover = nil
    }
}

enum Destination: Identifiable {
    case home
    case details
    case firstCover

    var id: String {
        switch self {
        case .home: return "home"
        case .details: return "details"
        case .firstCover: return "firstCover"
        }
    }
}
