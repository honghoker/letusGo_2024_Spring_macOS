//
//  letusGo_2024_Spring_macOSAppApp.swift
//  letusGo_2024_Spring_macOSApp
//
//  Created by 홍은표 on 3/16/24.
//

import SwiftUI

@main
struct letusGo_2024_Spring_macOSAppApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .frame(width: 840, height: 475)
        .background(.white)
        .fixedSize()
    }
    .windowResizability(.contentSize)
    .windowStyle(.hiddenTitleBar)
    .windowToolbarStyle(.unifiedCompact)
    .commandsRemoved()
  }
}
