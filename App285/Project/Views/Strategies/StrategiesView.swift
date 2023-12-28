//
//  StrategiesView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct StrategiesView: View {
    
    @StateObject var viewModel = StrategiesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Strategies")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach(viewModel.sviews, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.current_sviews = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim").opacity(viewModel.current_sviews == index ? 1 : 0)))
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(RoundedRectangle(cornerRadius: 8).fill(.white.opacity(0.1)))
                
                if viewModel.strategies.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.strategies, id: \.self) { index in
                               
                                HStack {
                                    
                                    Image(systemName: "soccerball")
                                        .foregroundColor(.white.opacity(0.3))
                                        .font(.system(size: 36, weight: .regular))
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(index.currentGame ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text(index.sName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        
                                    }, label: {
                                        
                                        Image(systemName: "star")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                    })
                                }
                                .onTapGesture {
                                    
                                    viewModel.selectedStrategy = index
                                    
                                    viewModel.isDetail = true
                                }
                            }
                        }
                    }
                }
                
                NavigationLink(destination: {
                    
                    AddStrategy(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                })
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchStrategies()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            SDetailView(viewModel: viewModel)
        })
    }
}

#Preview {
    StrategiesView()
}
