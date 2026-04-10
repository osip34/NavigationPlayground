//
//  AppCoordinator.swift
//  NavigationPlayground
//
//  Created by Andrii Osipchuk on 02.04.2026.
//

import SwiftUI

@Observable
class AppCoordinator: Coordinator {
    private let viewFactory: ViewFactory
    var rootState = NavigationState()
    
    init(viewFactory: ViewFactory = DefaultViewFactory()) {
        self.viewFactory = viewFactory
    }
    
    // MARK: - Root View
    func RootView() -> AnyView {
        let rootView = ContentView(onTap: { [weak self] in
                self?.navigateToFirstView()
            })
        let navigationContainer = NavigationContainer(content: { rootView }, state: rootState, viewProvider: self)
        
        return AnyView(navigationContainer)
    }
    
    // MARK: - Navigation Actions
    private func navigateToFirstView() {
        rootState.navigationStackPath.append(.home)
    }
    
    private func navigateToDetails(state: NavigationState) {
        state.navigationStackPath.append(.details)
    }
    
    private func navigateToFirstCover(state: NavigationState) {
        state.fullScreenCoverState = NavigationState()
        state.presentingFullScreenCover = .firstCover
    }
    
    private func navigateToSecondCover(state: NavigationState) {
        state.sheetState = NavigationState()
        state.presentingSheet = .secondCover
    }
    
    private func navigateToThirdDestination(state: NavigationState) {
        state.navigationStackPath.append(.thirdDestination)
    }
    
    private func backToRoot() {
        // Reset root state
        rootState.navigationStackPath.removeAll()
        rootState.presentingSheet = nil
        rootState.presentingFullScreenCover = nil
    }
}

// MARK: - View Provider
extension AppCoordinator: ViewProvider {
    func view(for destination: Destination, state: NavigationState) -> AnyView {
        let view: AnyView
        
        switch destination {
        case .home:
            view = viewFactory.makeView1(
                onNavigate: { [weak self] in self?.navigateToDetails(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .details:
            view = viewFactory.makeView2(
                onNavigate: { [weak self] in self?.navigateToFirstCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .firstCover:
            view = viewFactory.makeView3(
                onNavigate: { [weak self] in self?.navigateToSecondCover(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .secondCover:
            view = viewFactory.makeView4(
                onNavigate: { [weak self] in self?.navigateToThirdDestination(state: state) },
                onClose: { [weak self] in self?.backToRoot() }
            )
        case .thirdDestination:
            view = viewFactory.makeView5(
                onNavigate: {},
                onClose: { [weak self] in self?.backToRoot() }
            )
        }
        
        return view
    }
}
