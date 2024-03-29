//
//  EPDropdown.swift
//  letusGo_2024_Spring_macOSApp
//
//  Created by 홍은표 on 3/16/24.
//

import SwiftUI

struct EPDropdown<Content: View, PopoverContent: View>: NSViewRepresentable {
  typealias NSViewType = NSHostingView<Content>
  
  private let content: Content
  private let popoverContent: PopoverContent
  
  init(
    @ViewBuilder content: () -> Content,
    @ViewBuilder popoverContent: @escaping () -> PopoverContent
  ) {
    self.content = content()
    self.popoverContent = popoverContent()
  }
  
  func makeNSView(context: Context) -> NSHostingView<Content> {
    let hostingView = NSHostingView(rootView: content)
    let clickGesture: NSClickGestureRecognizer = .init(
      target: context.coordinator,
      action: #selector(Coordinator.onClickMenuButton)
    )
    hostingView.addGestureRecognizer(clickGesture)
    return hostingView
  }
  
  func updateNSView(_ nsView: NSHostingView<Content>, context: Context) {
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}

extension EPDropdown {
  class Coordinator {
    private let parent: EPDropdown
    private var popover: NSPopover? = nil
    
    init(_ parent: EPDropdown) {
      self.parent = parent
    }
    
    @objc func onClickMenuButton(_ sender: NSGestureRecognizer) {
      // close popover
      guard popover == nil else {
        popover?.close()
        popover = nil
        return
      }
      
      // sender.view == SwiftUI에서 표시되는 메뉴 버튼
      guard let view = sender.view else {
        return
      }
      
      // show popover
      let popover = NSPopover()
      let contentViewController = NSHostingController(rootView: parent.popoverContent)
      popover.contentViewController = contentViewController
      popover.contentSize = contentViewController.view.intrinsicContentSize
      
      // 당근 이미지 버튼의 bounds
      var rect = view.bounds
      
      // 현재 뷰가 위치한 윈도우의 contentView를 가져오는 코드
      guard let contentView = view.window?.contentView else {
        return
      }
      
      // 당근 이미지 버튼의 좌표를 현재 윈도우 기준의 전역 좌표계로 변환
      let globalPoint = view.convert(rect.origin, to: nil)
      
      // popover가 표시될 x 위치 계산
      rect.origin.x = globalPoint.x - 50
      // popover가 표시될 y 위치 계산
      rect.origin.y = contentView.frame.height - globalPoint.y
      
      // 윈도우(contentView) 기준으로 상대적인 위치에 popover를 표시
      popover.show(relativeTo: rect, of: contentView, preferredEdge: .maxY)
      
      self.popover = popover
    }
  }
}
