//
//  DropdownView.swift
//  letusGo_2024_Spring_macOSApp
//
//  Created by 홍은표 on 3/25/24.
//

import SwiftUI

struct DropdownView: View {
  var body: some View {
    EPDropdown(
      content: {
        EPButton()
      },
      popoverContent: {
        EPPopoverContent()
      }
    )
    .frame(width: 48, height: 44)
  }
}
