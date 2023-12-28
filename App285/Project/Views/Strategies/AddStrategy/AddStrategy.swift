//
//  AddStrategy.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI

struct AddStrategy: View {
    
    @StateObject var viewModel: StrategiesViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
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
                
                Text("New strategy")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Image(systemName: "soccerball")
                        .foregroundColor(.white.opacity(0.2))
                        .font(.system(size: 90))
                        .padding(30)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Strategy name")
                            .foregroundColor(viewModel.sName.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.sName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.sName)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                    .padding(2)
                    
                    Menu(content: {
                        
                        ForEach(viewModel.CreatedGames, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedGame = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.selectedGame.isEmpty {
                            
                            HStack {
                                
                                Text(viewModel.selectedGame.isEmpty ? "You don't have any game" : "Select game")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                                
                            }
                            
                        } else {
                            
                            HStack {
                                
                                Text(viewModel.selectedGame)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Spacer()
                             
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium))
                            }
                        }
                    })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                        .padding(2)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Description")
                            .foregroundColor(viewModel.sDescription.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.sDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.sDescription)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .medium))
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color(.white).opacity(0.3)))
                    .padding(2)
                }
                
                Button(action: {
                    
                    viewModel.addStrategy(currentGame: viewModel.selectedGame, completion: {
                        
                        viewModel.sName = ""
                        viewModel.sDescription = ""
                        viewModel.selectedGame = ""
                    })
                                        
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add game")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim2")))
                })
                .opacity(viewModel.sName.isEmpty || viewModel.sDescription.isEmpty || viewModel.selectedGame.isEmpty ? 0.5 : 1)
                .disabled(viewModel.sName.isEmpty || viewModel.sDescription.isEmpty || viewModel.selectedGame.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddStrategy(viewModel: StrategiesViewModel())
}
