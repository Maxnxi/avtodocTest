//
//  CustomTab.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 13/07/2022.
//

import SwiftUI

struct CustomTab: View {
    
    @State private var selected = 0
    @State private var scaleKoef: CGFloat = 1.0
    
    var body: some View {
        VStack{
            switch selected {
            case 0:
                NewListView(viewModel: NewsListViewModel())
            case 1:
                News2ListView(viewModel: News2ListViewModel())
            case 2:
                Text("in dev 3")
            case 3:
                Text("in dev 4")
            case 4:
                Text("in dev 5")
            default:
                NewListView(viewModel: NewsListViewModel())
            }
            
            Spacer(minLength: 0)
            
            ZStack{
                HStack(spacing: 4){
                    Button {
                        self.selected = 0
                    } label: {
                        VStack{
                            Image(systemName: "newspaper")
                            Text("News")
                                //.font(.custom(Constants.fontAvenir, size: 12))
                        }
                    }.foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 1
                    } label: {
                        VStack{
                            Image(systemName: "house")
                            Text("House")
                                
                        }
                    }.foregroundColor(self.selected == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 80)
                    
                    Button {
                        self.selected = 2
                    } label: {
                        VStack {
                            Image(systemName: "house")
                            Text("House")
                                
                        }
                    }.foregroundColor(self.selected == 2 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button {
                        self.selected = 3
                    } label: {
                        VStack{
                            Image(systemName: "house")
                            Text("Settings")
                                
                        }
                    }.foregroundColor(self.selected == 3 ? .black : .gray)
                    
                }
                .padding()
                .padding(.horizontal, 12)
                .background(CurvedTabBack())
                
                Button {
                    scaleKoef == 1 ? (scaleKoef = 0.5) : (scaleKoef = 1)
                    self.selected = 4
                } label: {
                    
                    Image("avtodocLogo")
                        .renderingMode(.original)
                        .padding(18)
                }
                .background(Color.yellow)
                .clipShape(Circle())
                .scaleEffect(scaleKoef)
                .offset(y: -22)
                .shadow(radius: 5)
            }
        }.background(Color.black.edgesIgnoringSafeArea(.top))
            //.preferredColorScheme(.dark)
    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab()
    }
}

