//
//  ContentView.swift
//  letusGo_2024_Spring_macOSApp
//
//  Created by 홍은표 on 3/16/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Group {
      DropdownView()
        .offset(y: 80)
    }
    .background(
      thumbnail
    )
  }
  
  fileprivate var thumbnail: some View {
    Image("thumbnail")
  }
}

#Preview {
  ContentView()
}
