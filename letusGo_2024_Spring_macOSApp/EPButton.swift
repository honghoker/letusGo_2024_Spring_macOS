//
//  EPButton.swift
//  letusGo_2024_Spring_macOSApp
//
//  Created by 홍은표 on 3/16/24.
//

import SwiftUI

struct EPButton: View {
  var body: some View {
    button
  }
  
  fileprivate var button: some View {
    Button(action: {
      
    }, label: {
      carrotImage
    })
    .buttonStyle(EPButtonStyle())
  }
  
  fileprivate var carrotImage: some View {
    Image("carrot")
      .resizable()
      .aspectRatio(contentMode: .fit)
  }
}

private struct EPButtonStyle: ButtonStyle {
  fileprivate func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 32)
      .padding(.horizontal, 8)
      .padding(.vertical, 6)
      .cornerRadius(8)
      .overlay {
        RoundedRectangle(cornerRadius: 8)
          .stroke(.gray, lineWidth: 1)
      }
      .background(.white)
  }
}
