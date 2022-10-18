//
//  WelcomeView.swift
//  SwiftUiMapApp
//
//  Created by Raul Oaida on 10/13/22.
//

import SwiftUI

struct WelcomeView: View {
  //  @AppStorage("onboarding") var onboarding = true
    var body: some View {
  
        ZStack {
            Color(#colorLiteral(red: 0.975, green: 0.975, blue: 0.975, alpha: 1))
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Image("WelcomeLogo")
                    //Welcome back.
                        .padding(.vertical, 20)
                    Text("Welcome\nback.").font(.custom("Roboto Regular", size: 48))
                        .padding(.leading, 18)
                    Spacer()
                    SignInButton
                    
                    Spacer()
                }
                HStack {
                    Text("don’t have an account?").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                        .frame(width: 160, height: 20)
                    
                    SignUp
                }
                Spacer()
    
            }
    
        }
  
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            
    }
}


private var SignInButton: some View {
    Button {
    } label: {
        ZStack {
            Rectangle()
                .frame(width: 74, height: 10)
                .foregroundColor(Color("Yellow"))
                .offset(y: 8)
            Text("Sign In")
            .font(.custom("Roboto Regular", size: 20))
            .frame(width: 125, height: 35)
            .foregroundColor(.black)
      
        }
     
    }
  
}


private var SignUp: some View {
    
    Button {
     
    } label: {
        ZStack {

            Text("Sign Up")
            .font(.custom("Roboto Regular", size: 14))
            .frame(width: 50, height: 20)
            .foregroundColor(Color("Green"))


        }

    }

}
