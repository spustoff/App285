//
//  R1.swift
//  App285
//
//  Created by IGOR on 19/12/2023.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                
                VStack(spacing: 10) {
                    
                    Text("Awesome games")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Control your playing games")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(width: 230, height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            }
        }
    }
}

#Preview {
    R1()
}
