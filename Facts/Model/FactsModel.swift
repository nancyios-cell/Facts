//
//  FactsModel.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import UIKit
import SwiftUI

/*"title":"About Canada",
"rows":[
    {
    "title":"Beavers",
    "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
    "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
    }]*/

/* class FactsModel: NSObject {
    var rows = [Facts]()
    var title = ""
    
    init(object:[String:AnyObject]) {
        for dict in object["rows"] as! [[String: AnyObject]]{
            let data2 = Facts.init(object: dict)
            rows.append(data2)
        }
        title = object["title"] as! String
    }

}

class Facts: NSObject {
     var title = ""
     var descriptions = ""
     var imageHref = ""
    
    init(object:[String: AnyObject]) {
        title = object["title"] as! String
        descriptions = object["description"] as! String
        imageHref = object["imageHref"] as! String
    }
}  */

/*public protocol Identifiable {

    var id: UUID {
        return UUID()
    }
} */

struct FactsModel:Hashable, Codable ,Identifiable{
    var id: UUID {
        return UUID()
    }
    var title : String?
    let rows: [Facts]?

    enum CodingKeys: String, CodingKey {
        case title
        case rows 
    }

}

struct Facts: Hashable,Codable,Identifiable {
    var id: UUID {
        return UUID()
    }
    var description : String?
    fileprivate var imageHref : String?
    var title : String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageHref
        case description
    }

}

extension Facts {

    var image: Image {
        if let imgHref = imageHref {
            return ImageStore.shared.image(name: imgHref, size: 30)
        } else {
            return Image("ic_img")
        }
    }
}


final class ImageStore {
    fileprivate typealias _ImageDictionary = [String: [Int: CGImage]]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var originalSize = 250
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String, size: Int) -> Image {
        let index = _guaranteeInitialImage(name: name)
        
        let sizedImage = images.values[index][size]
            ?? _sizeImage(images.values[index][ImageStore.originalSize]!, to: size * ImageStore.scale)
        images.values[index][size] = sizedImage
        
        return Image(sizedImage, scale: Length(ImageStore.scale), label: Text(verbatim: name))
    }
    
    fileprivate func _guaranteeInitialImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        
        images[name] = [ImageStore.originalSize: image]
        return images.index(forKey: name)!
    }
    
    fileprivate func _sizeImage(_ image: CGImage, to size: Int) -> CGImage {
        guard
            let colorSpace = image.colorSpace,
            let context = CGContext(
                data: nil,
                width: size, height: size,
                bitsPerComponent: image.bitsPerComponent,
                bytesPerRow: image.bytesPerRow,
                space: colorSpace,
                bitmapInfo: image.bitmapInfo.rawValue)
            else {
                fatalError("Couldn't create graphics context.")
        }
        context.interpolationQuality = .high
        context.draw(image, in: CGRect(x: 0, y: 0, width: size, height: size))
        
        if let sizedImage = context.makeImage() {
            return sizedImage
        } else {
            fatalError("Couldn't resize image.")
        }
    }
}
