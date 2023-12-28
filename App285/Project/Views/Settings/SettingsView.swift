//
//  SettingsView.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI
import StoreKit
import CoreData

struct SettingsView: View {
    
    @State var isReset: Bool = false
    @AppStorage("matchValue") var matchValue: Int = 0
    @AppStorage("CreatedGames") var CreatedGames: [String] = []

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                            
                            Text("Rate us")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()

                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/4cb09360-1445-4c90-9c7a-cb6d55e1f412") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)

                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()

                        }
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color("bg2")))
                    
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        isReset = true
                    }
                    
                }, label: {
                    
                    Text("Reset progress")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .padding()
                        .frame(width: 200)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim2")))
                    
                })
                
            }
            .padding()
        }
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("Your entire progress will be permanently deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {

                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.blue)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        .frame(maxWidth: .infinity)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteAllData()
                        matchValue = 0
                        CreatedGames.removeAll()
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .frame(maxWidth: .infinity)
                }
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.7)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    SettingsView()
}
