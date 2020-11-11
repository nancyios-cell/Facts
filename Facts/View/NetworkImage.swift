//
//  NetworkImage.swift
//  Facts
//
//  Created by Nancy on 11/11/20.
//

import SwiftUI
import Kingfisher
import UIKit

public struct NetworkImage: SwiftUI.View {

  // swiftlint:disable:next redundant_optional_initialization
  @State private var image: UIImage? = nil

  public let imageURL: URL?
  public let placeholderImage: UIImage
public let animation: Animation = .default

  public var body: some SwiftUI.View {
    Image(uiImage: image ?? placeholderImage)
      .resizable()
      .onAppear(perform: loadImage)
      .transition(.opacity)
      .id(image ?? placeholderImage)
  }

  private func loadImage() {
    guard let imageURL = imageURL, image == nil else { return }
    KingfisherManager.shared.retrieveImage(with: imageURL, options: .none, progressBlock: .none) { (image, _, _, nil) in
        withAnimation(self.animation) {
            self.image = image
        }
    }
  }
}

#if DEBUG
// swiftlint:disable:next type_name
struct NetworkImage_Previews: PreviewProvider {
  static var previews: some SwiftUI.View {
    NetworkImage(imageURL: URL(string: "https://www.apple.com/favicon.ico")!,
                 placeholderImage: UIImage(systemName: "bookmark")!)
  }
}
#endif
