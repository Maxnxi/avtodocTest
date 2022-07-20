//
//  CollectionView.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 18/07/2022.
//

import SwiftUI

struct CollectionView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ListViewController
    
    func makeUIViewController(context: Context) -> ListViewController {
        let listVC = ListViewController()
        return listVC
        
        }

        func updateUIViewController(_ uiViewController: ListViewController, context: Context) {
            
        }
   
}

//struct CollectionView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> some UIView {
//
//        let collectionView = UICollectionView()
//
//
//        return collectionView
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
//}
