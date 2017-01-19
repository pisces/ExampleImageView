//
//  ViewController.swift
//  ExampleImageView
//
//  Created by pisces on 19/01/2017.
//  Copyright © 2017 pisces. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "mediaType IN %@", [PHAssetMediaType.image.rawValue])
        
        var firstAsset: PHAsset?
        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        smartAlbums.enumerateObjects({ (collection, index, pointer) in
            let assets = PHAsset.fetchAssets(in: collection, options: options)
            assets.enumerateObjects( {(asset, index, pointer) in
                firstAsset = asset
            })
        })
        
        let webImageModel = WebImageModel()
        webImageModel.thumbUrl = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSR7BzmUok6YYwW7B9GOHj8c1DU8icPA4hL8Fv8NBuxoUz7LaWY"
        webImageModel.url = "http://retrica.co/assets/img/common/twitter.png"
        
        let dataImageModel = DataImageModel()
        dataImageModel.data = UIImagePNGRepresentation(UIImage(named: "screen696x696.jpg")!)
        dataImageModel.thumbData = UIImagePNGRepresentation(UIImage(named: "screen696x696_thumb.jpg")!)
        
        let bundleImageModel = BundleImageModel()
        bundleImageModel.thumbFilename = "screen696x696_thumb.jpg"
        bundleImageModel.filename = "screen696x696.jpg"
        
        let imageView1 = append(forWebImage: webImageModel)
        let imageView2 = append(forDataImage: dataImageModel)
        let imageView3 = append(forBundleImage: bundleImageModel)
        let imageView4 = append(forAsset: firstAsset)
        
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(imageView3)
        self.view.addSubview(imageView4)
        
        // TODO: 오토레이아웃을 사용해 imageView1, imageView2, imageView3를 배치
    }
    
    private func append(forWebImage model: WebImageModel?) -> ExampleImageView {
        let view = ExampleImageView()
        view.model = model
        return view
    }
    
    private func append(forAsset asset: PHAsset?) -> ExampleImageView {
        let view = ExampleImageView()
        view.model = asset
        return view
    }
    
    private func append(forDataImage model: DataImageModel?) -> ExampleImageView {
        let view = ExampleImageView()
        view.model = model
        return view
    }
    
    private func append(forBundleImage model: BundleImageModel?) -> ExampleImageView {
        let view = ExampleImageView()
        view.model = model
        return view
    }
}

