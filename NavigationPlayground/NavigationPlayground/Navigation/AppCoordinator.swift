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
    
    private let viewFactory: ViewFactory
    
    init(viewFactory: ViewFactory = DefaultViewFactory()) {
        self.viewFactory = viewFactory
    }
    
    @ViewBuilder func view(for destination: Destination, state: NavigationState) -> some View {
        switch destination {
        case .home:
            viewFactory.makeView1(
                onNavigate: { [weak self] in self?.navigateToDetails(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .details:
            viewFactory.makeView2(
                onNavigate: { [weak self] in self?.navigateToFirstCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .firstCover:
            viewFactory.makeView3(
                onNavigate: { [weak self] in self?.navigateToSecondCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .secondCover:
            viewFactory.makeView4(
                onNavigate: { [weak self] in self?.navigateToThirdDestination(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .thirdDestination:
            viewFactory.makeView5(
                onNavigate: {},
                onClose: { [weak self] in self?.backToRoot() }
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
        state.fullScreenCoverState = NavigationState()
        state.presentingFullScreenCover = .firstCover
    }
    
    func navigateToSecondCover(state: NavigationState) {
        state.sheetState = NavigationState()
        state.presentingSheet = .secondCover
    }
    
    func navigateToThirdDestination(state: NavigationState) {
        state.navigationStackPath.append(.thirdDestination)
    }
    
    func backToRoot() {
        // Reset root state
        rootState.navigationStackPath.removeAll()
        rootState.presentingSheet = nil
        rootState.presentingFullScreenCover = nil
        rootState.sheetState = nil
        rootState.fullScreenCoverState = nil
    }
}

enum Destination: Identifiable {
    case home
    case details
    case firstCover
    case secondCover
    case thirdDestination

    var id: String {
        switch self {
        case .home: return "home"
        case .details: return "details"
        case .firstCover: return "firstCover"
        case .secondCover: return "secondCover"
        case .thirdDestination: return "thirdDestination"
        }
    }
}
