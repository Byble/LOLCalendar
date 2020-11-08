//
//  APIService.swift
//  LOLCalendar
//
//  Created by 김민국 on 2020/11/05.
//

import Foundation
import RxSwift
import RxCocoa

class APIService {
    
    static func fetchLOLESport(url: URL) -> Observable<LOLESport> {
        return Observable.create { observer in
            let task = URLSession.shared.lOLESportsTask(with: url) { (league, response, error) in
                if let error = error{
                    print(error)
                    observer.onError(error)
                }
                if let lolEports = league {
                    print("hi")
                    var tmp:[Int] = []
                    for lol in lolEports {
                        print(lol)
                        if !tmp.contains(lol.tournamentID){
                            print(lol.tournamentID)
                            tmp.append(lol.tournamentID)
                            observer.onNext(lol)
                        }
                    }
                    observer.onCompleted()
                }else{
                    print("fuck")
                }
//                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
//                    print("statusCode should be 200, but is (httpStatus.statusCode)")
//                    observer.onError(error!)
//                } else if let lolESport = league {
//                    var tmp:[Int] = []
//                    for lol in lolESport {
//                        if !tmp.contains(lol.tournamentID){
//                            print(lol.tournamentID)
//                            tmp.append(lol.tournamentID)
//                            observer.onNext(lol)
//                        }
//                    }
//                    observer.onCompleted()
//                } else{
//                    observer.onError(error!)
//                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    static func fetchBracket(url: URL) -> Observable<LOLBracketElement> {
        return Observable.create { observer in
            let task = URLSession.shared.lOLBracketTask(with: url) { (data, response, error) in
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode should be 200, but is (httpStatus.statusCode)")
                    observer.onError(error!)
                } else if let data = data {
                    for bra in data {
                        observer.onNext(bra)
                    }
//                    observer.onNext(data)
                    observer.onCompleted()
                } else {
                    observer.onError(error!)
                }
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
//    static func fetchBracket(url: URL) -> Observable<LOLBracketElement> {
//        return Observable.create { observer in
//            let task = URLSession.shared.lOLBracketTask(with: url) { (brackets, response, error) in
//
//                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
//                    print("statusCode should be 200, but is (httpStatus.statusCode)")
//                    observer.onError(error!)
//                } else if let brackets = brackets {
//                    for bracket in brackets{
//                        observer.onNext(bracket)
//                    }
//
//
//                    observer.onCompleted()
//                } else {
//                    observer.onError(error!)
//                }
//            }
//            task.resume()
//
//            return Disposables.create {
//                task.cancel()
//            }
//        }
//    }
    
    static func loadImage(url: URL) -> Observable<UIImage?> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                guard let data = data,
                      let image = UIImage(data: data) else {
                    observer.onNext(nil)
                    observer.onCompleted()
                    return
                }
                
                observer.onNext(image)
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
