//
//  CateratorService.swift
//  Caterator
//
//  Created by serif mete on 2.04.2023.
//

import Foundation

//MARK: - Data Yükleme Servisi
final class DownloadService {
    var modelsu = YoastHeadJSON.self    //MARK: - Completion'lı fonksiyon
    func downloadService(completion: @escaping (Cataretor?) -> ()) {
        //MARK: - Url Kontrolü optinal dan çıkarmak için
        guard let url = URL(string:"https://serif-mete.online/wp-json/wp/v2/pages/396") else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            //MARK: - Switch Case İle Kontrol Sağlamak için
            switch result {
            case .success(let data): // success data
                completion(self.handleWithData(data))
            case .failure(let error): // error part
                self.handleWithError(error)
            }
        }
    }
    //MARK: - Error u Ele Aldığımız Kısım
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    //MARK: - Data'yı ele aldığımız işlediğimiz kısım ( decode )
    private func handleWithData(_ data: Data) -> Cataretor? {
        do {
            let JsonDec = try JSONDecoder().decode(Cataretor.self, from: data)
            return JsonDec
        } catch {
            print(error)
            return nil
        }
    }
}
