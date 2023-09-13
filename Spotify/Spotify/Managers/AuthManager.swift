//
//  AuthManager.swift
//  Spotify
//
//  Created by Paula Rolim on 12/09/23.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientId: String = ProcessInfo.processInfo.environment["CLIENT_ID"] ?? ""
        static let clientSecret: String = ProcessInfo.processInfo.environment["CLIENT_SECRET"] ?? ""
    }
    
    private init() { }
    
    public var signInUrl: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let redirectUrl = "https://github.com/paularolim"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientId)&scope=\(scope)&redirect_uri=\(redirectUrl)&show_dialog=true"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool) -> Void)
    ) {
        // get token
    }
    
    public func refreshAccessToken() {
        
    }
    
    public func cacheToken() {
        
    }
}
