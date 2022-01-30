//
//  ProfileSummary.swift
//  landmarksTutorial
//
//  Created by Michel Franklin Silva Bernardo on 12/01/22.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notificações: \(profile.prefersNotifications ? "Ativado": "Desativado" )")
                Text("Imagem sazonal: \(profile.seasonalPhoto.rawValue)")
                Text("Data fim: ") + Text(profile.goalDate, style: .date)
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Conquistas")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "Primeira Caminhada")
                            HikeBadge(name: "Dia da Terra")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Décima Caminhada")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Últimas caminhadas")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
            .environment(\.locale, Locale(identifier: "pt"))
    }
}
