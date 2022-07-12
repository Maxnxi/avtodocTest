//
//  NewListView.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 11/07/2022.
//

import SwiftUI

struct NewListView: View {
    @ObservedObject var viewModel: NewsListViewModel
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                List {
                    Section(header: Text("Header")) { // header ?
                        ForEach(viewModel.news) {
                            new in
                            NavigationLink(destination: NewDetailView()) {
                                
                                    NewListCellView(viewModel: new)
//                                    .onAppear() {
//                                        if new == viewModel.news.last {
//                                            viewModel.getNewsForPage(viewModel.currentPage)
//                                        }
//                                    }
                                
                            }
                            .onAppear() {
                                if new == viewModel.news.last {
                                    viewModel.getNewsForPage(viewModel.currentPage)
                                }
                            }
                        }
                    }
                    
                }
                
                
            }
            .background(Color.green)
            .onAppear() {
                if viewModel.news.isEmpty {
                    viewModel.getNewsForPage(1)
                }
            }
        }
    }
}

struct NewListView_Previews: PreviewProvider {
    static var previews: some View {
        NewListView(viewModel: NewsListViewModel())
    }
}
