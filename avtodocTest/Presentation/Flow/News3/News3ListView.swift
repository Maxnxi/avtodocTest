//
//  News3ListView.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 18/07/2022.
//

import SwiftUI

struct News3ListView: View {
    
    @ObservedObject var viewModel: News2ListViewModel
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                CollectionView()
                Spacer()
                List {
                    Section(header: Text("Header")) { // header ?
                        ForEach(viewModel.news) {
                            new in
                            NavigationLink(destination: NewDetailView()) {
                                
                                    NewListCellView(viewModel: new)
                            }
                            .task {
                                if new == viewModel.news.last {
                                    await viewModel.getNews(for: viewModel.currentPage)
                                }
                            }

                        }
                    } // Section
                } // List
            } // VStack
            .background(Color.green)
            .task {
                if viewModel.news.isEmpty {
                    await viewModel.getNews(for: 1)// getNewsForPage(1)
                }
            }
        }
    }
}

struct News3ListView_Previews: PreviewProvider {
    static var previews: some View {
        News3ListView(viewModel: News2ListViewModel(networkService: NetworkServiceAwInputImpl()))
    }
}


