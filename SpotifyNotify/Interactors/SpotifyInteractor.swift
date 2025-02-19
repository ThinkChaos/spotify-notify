//
//  SpotifyInteractor.swift
//  SpotifyNotify
//
//  Created by Szymon Maślanka on 27/02/2018.
//  Copyright © 2018 Szymon Maślanka. All rights reserved.
//

import AppKit
import ScriptingBridge

final class SpotifyInteractor: SBApplicationDelegate {
	private let spotify: SpotifyApplication? = SBApplication(bundleIdentifier: SpotifyConstants.bundleIdentifier)
	
    init() {
        spotify?.delegate = self
    }
    
	var isFrontmost: Bool { return NSWorkspace.shared.frontmostApplication?.bundleIdentifier == SpotifyConstants.bundleIdentifier }
	
	var currentTrack: Track? { return spotify?.currentTrack?.track }
	var soundVolume: Int? { return spotify?.soundVolume }
	var playerState: SpotifyEPlS? { return spotify?.playerState }
	var playerPosition: Double? { return spotify?.playerPosition }
	
    func activate() {
        spotify?.activate()
    }
    
	func nextTrack() {
		spotify?.nextTrack?()
	}
	
	func previousTrack() {
		spotify?.previousTrack?()
	}
	
	func playPause() {
		spotify?.playpause?()
	}
	
	func play() {
		spotify?.play?()
	}
	
	func pause() {
		spotify?.pause?()
	}
    
    func eventDidFail(_ event: UnsafePointer<AppleEvent>, withError error: Error) -> Any? {
        print("Scripting Error: \(error)")
        return nil
    }
}
