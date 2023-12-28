//
//  AddGame.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI
import CoreData

struct AddGame: View {
    
    @StateObject var viewModel: GamesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                ZStack {
                    
                    Text("Add game")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Image(systemName: "soccerball")
                            .foregroundColor(.white.opacity(0.3))
                            .font(.system(size: 90))
                            .padding(30)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(viewModel.gameName.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.gameName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.gameName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Description")
                                .foregroundColor(viewModel.gameDescription.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.gameDescription.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.gameDescription)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Times played:")
                                .foregroundColor(viewModel.gameTP.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.gameTP.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.gameTP)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Win-rate, %:")
                                .foregroundColor(viewModel.gameWR.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.gameWR.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.gameWR)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                    }
                    .padding(1)
                }
                
                Button(action: {
                    
                    viewModel.addGame(completion: {
                        
                        viewModel.gameDescription = ""
                        viewModel.gameTP = ""
                        viewModel.gameWR = ""
                    })
                    
                    viewModel.CreatedGames.append(viewModel.gameName)
                    
                    viewModel.gameName = ""
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add game")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                })
                .opacity(viewModel.gameName.isEmpty || viewModel.gameDescription.isEmpty || viewModel.gameTP.isEmpty || viewModel.gameWR.isEmpty ? 0.5 : 1)
                .disabled(viewModel.gameName.isEmpty || viewModel.gameDescription.isEmpty || viewModel.gameTP.isEmpty || viewModel.gameWR.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddGame(viewModel: GamesViewModel())
}
