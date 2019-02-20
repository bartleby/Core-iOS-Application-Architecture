//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___
//

import Foundation

// MARK: - FileManager extension

/// This extension adds some useful functions to FileManager.
public extension FileManager {
    // MARK: - Variables
    
    /// Path type enum.
    ///
    /// - mainBundle: Main bundle path.
    /// - library: Library path.
    /// - documents: Documents path.
    /// - cache: Cache path.
    public enum PathType: Equatable {
        case mainBundle
        case library
        case documents
        case cache
        case applicationSupport
        case source(String)
        
        static public func ==(lhs: PathType, rhs: PathType) -> Bool {
            switch (lhs, rhs) {
            case let (.source(a),   .source(b)):
                return a == b
            case (.mainBundle, .mainBundle):
                return true
            case (.library, .library):
                return true
            case (.documents, .documents):
                return true
            case (.cache, .cache):
                return true
            case (.applicationSupport, .applicationSupport):
                return true
            default:
                return false
            }
        }
    }
    
    public enum FileManagerError: Error {
        case pathNotExist
        case pathNotAllowed
    }

    // MARK: - Functions
    
    /// Get the path for a PathType.
    ///
    /// - Parameter path: Path type.
    /// - Returns: Returns the path type String.
    public func pathFor(_ path: PathType) -> String? {
        var pathString: String?
        
        switch path {
        case .mainBundle:
            pathString = self.mainBundlePath()
        case .library:
            pathString = self.libraryPath()
        case .documents:
            pathString = self.documentsPath()
        case .cache:
            pathString = self.cachePath()
        case .applicationSupport:
            pathString = self.applicationSupportPath()
        case .source(let src):
            pathString = src
        }
        
        
        return pathString
    }
    
    /// Save a file with given content.
    ///
    /// - Parameters:
    ///   - file: File to be saved.
    ///   - path: File path.
    ///   - content: Content to be saved.
    /// - Throws: write(toFile:, atomically:, encoding:) errors.
    public func save(file: String, in path: PathType, content: String) throws {
        guard let path = FileManager.default.pathFor(path) else {
            return
        }
        try content.write(toFile: (path as NSString).appendingPathComponent(file), atomically: true, encoding: .utf8)
    }
    
    /// Read a file an returns the content as String.
    ///
    /// - Parameters:
    ///   - file: File to be read.
    ///   - path: File path.
    /// - Returns: Returns the content of the file a String.
    /// - Throws: Throws String(contentsOfFile:, encoding:) errors.
    public func read(file: String, from path: PathType) throws -> String? {
        guard let path = FileManager.default.pathFor(path) else {
            return nil
        }
        return try String(contentsOfFile: (path as NSString).appendingPathComponent(file), encoding: .utf8)
    }
    
    /// Save an object into a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - object: Object to save into PLIST.
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
//    @discardableResult
//    public func savePlist(object: Any, in path: PathType, filename: String) -> Bool {
//        let path = checkPlist(path: path, filename: filename)
//
//        if path.exist {
//            return NSKeyedArchiver.archiveRootObject(object, toFile: path.path)
//        }
//        return false
//    }
    
    /// Load an object from a PLIST with given filename.
    ///
    /// - Parameters:
    ///   - path: Path of PLIST.
    ///   - filename: PLIST filename.
    /// - Returns: Returns the loaded object.
//    public func readPlist(from path: PathType, filename: String) -> Any? {
//        let path = checkPlist(path: path, filename: filename)
//        
//        if path.exist {
//            return NSKeyedUnarchiver.unarchiveObject(withFile: path.path)
//        }
//        return nil
//    }
    
    /// Check if plist exist.
    ///
    /// - Parameters:
    ///   - path: Path of plist.
    ///   - filename: Plist filename.
    /// - Returns: Returns if plist exists and path.
    private func checkPlist(path: PathType, filename: String) -> (exist: Bool, path: String) {
        guard let path = FileManager.default.pathFor(path), let finalPath = ((path as NSString).appendingPathComponent(filename) as NSString).appendingPathExtension("plist") else {
            return (false, "")
        }
        return (true, finalPath)
    }
    
    /// Get Main Bundle path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func mainBundlePath(file: String = "") -> String? {
        return Bundle.main.path(forResource: (file as NSString).deletingPathExtension, ofType: (file as NSString).pathExtension)
    }
    
    /// Get Documents path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func documentsPath(file: String = "") -> String? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return (documentsURL.path as NSString).appendingPathComponent(file)
    }
    
    /// Get Library path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func libraryPath(file: String = "") -> String? {
        guard let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            return nil
        }
        return (libraryURL.path as NSString).appendingPathComponent(file)
    }
    
    /// Get Cache path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func cachePath(file: String = "") -> String? {
        guard let cacheURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return (cacheURL.path as NSString).appendingPathComponent(file)
    }
    
    /// Get Application Support path for a filename.
    ///
    /// - Parameter file: Filename
    /// - Returns: Returns the path as a String.
    public func applicationSupportPath(file: String = "") -> String? {
        guard let applicationSupportURL = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            return nil
        }
        return (applicationSupportURL.path as NSString).appendingPathComponent(file)
    }
    
    /// Returns the file size.
    ///
    /// - Parameters:
    ///   - file: Filename.
    ///   - path: Path of the file.
    /// - Returns: Returns the file size.
    /// - Throws: Throws FileManager.default.attributesOfItem(atPath: ) errors.
    public func size(file: String, from path: PathType) throws -> Float? {
        if !file.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                return nil
            }
            
            let finalPath = (path as NSString).appendingPathComponent(file)
            
            if FileManager.default.fileExists(atPath: finalPath) {
                let fileAttributes = try FileManager.default.attributesOfItem(atPath: finalPath)
                return fileAttributes[FileAttributeKey.size] as? Float
            }
        }
        
        return nil
    }
    
    /// Delete a file with the given filename.
    ///
    /// - Parameters:
    ///   - file: File to delete.
    ///   - path: Path of the file.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.removeItem(atPath: ) errors.
    
    public func delete(file: String, from path: PathType) throws {
        if !file.isEmpty {
            guard let path = FileManager.default.pathFor(path) else {
                throw FileManagerError.pathNotExist
            }
            
            if FileManager.default.fileExists(atPath: (path as NSString).appendingPathComponent(file)) {
                try FileManager.default.removeItem(atPath: (path as NSString).appendingPathComponent(file))
            }
        } else {
            throw FileManagerError.pathNotExist
        }
    }
    
    /// Move a file from a path to another.
    ///
    /// - Parameters:
    ///   - file: Filename to move.
    ///   - origin: Origin path of the file.
    ///   - destination:  Destination path of the file.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.moveItem(atPath:, toPath:) and BFKitError errors.
    public func move(file: String, from origin: PathType, to destination: PathType) throws {
        let paths = try check(file: file, origin: origin, destination: destination)
        
        if paths.fileExist {
            try FileManager.default.moveItem(atPath: paths.origin, toPath: paths.destination)
        }
    }
    
    /// Copy a file into another path.
    ///
    /// - Parameters:
    ///   - file: Filename to copy.
    ///   - origin: Origin path
    ///   - destination: Destination path
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.copyItem(atPath:, toPath:) and BFKitError errors.
    public func copy(file: String, from origin: PathType, to destination: PathType) throws {
        let paths = try check(file: file, origin: origin, destination: destination)
        
        if paths.fileExist {
            try FileManager.default.copyItem(atPath: paths.origin, toPath: paths.destination)
        }
    }
    
    /// Check is orign path, destination path and file exists.
    ///
    /// - Parameters:
    ///   - file: File.
    ///   - origin: Origin path.
    ///   - destination: Destination path.
    /// - Returns: Returns a tuple with origin, destination and if file exist.
    /// - Throws: Throws BFKitError errors.
    private func check(file: String, origin: PathType, destination: PathType) throws -> (origin: String, destination: String, fileExist: Bool) {
        guard let originPath = FileManager.default.pathFor(origin), let destinationPath = FileManager.default.pathFor(destination) else {
            throw FileManagerError.pathNotExist
        }
        guard destination != .mainBundle else {
            throw FileManagerError.pathNotAllowed
        }
        
        let finalOriginPath = (originPath as NSString).appendingPathComponent(file)
        let finalDestinationPath = (destinationPath as NSString).appendingPathComponent(file)
        
        if FileManager.default.fileExists(atPath: finalOriginPath) {
            return (finalOriginPath, finalDestinationPath, true)
        }
        return (finalOriginPath, finalDestinationPath, false)
    }
    
    /// Rename a file with another filename.
    ///
    /// - Parameters:
    ///   - file: Filename to rename.
    ///   - origin: Origin path.
    ///   - newName: New filename.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws FileManager.default.copyItem(atPath:, toPath:), FileManager.default.removeItem(atPath:, toPath:) and BFKitError errors.
    public func rename(file: String, in origin: PathType, to newName: String) throws {
        guard let originPath = FileManager.default.pathFor(origin) else {
            throw FileManagerError.pathNotExist
        }
        
        let finalOriginPath = (originPath as NSString).appendingPathComponent(file)
        
        if FileManager.default.fileExists(atPath: finalOriginPath) {
            let destinationPath: String = finalOriginPath.replacingOccurrences(of: file, with: newName)
            try FileManager.default.copyItem(atPath: finalOriginPath, toPath: destinationPath)
            try FileManager.default.removeItem(atPath: finalOriginPath)
        }
    }
    
    /// Set settings for object and key. The file will be saved in the Library path if not exist.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - object: Object to set.
    ///   - objKey: Object key.
    /// - Returns: Returns true if the operation was successful, otherwise false.
    /// - Throws: Throws BFKitError errors.
    @discardableResult
    public func setSettings(filename: String, object: Any, forKey objKey: String) -> Bool {
        guard var path = FileManager.default.pathFor(.applicationSupport) else {
            return false
        }
        path = (path as NSString).appendingPathComponent("\(filename)-Settings.plist")
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            loadedPlist = NSMutableDictionary()
        }
        
        loadedPlist[objKey] = object
        
        return loadedPlist.write(toFile: path, atomically: true)
    }
    
    /// Get settings for key.
    ///
    /// - Parameters:
    ///   - filename: Settings filename. "-Settings" will be automatically added.
    ///   - forKey: Object key.
    /// - Returns: Returns the object for the given key.
    public func getSettings(filename: String, forKey: String) -> Any? {
        guard var path = FileManager.default.pathFor(.applicationSupport) else {
            return nil
        }
        path = (path as NSString).appendingPathComponent("\(filename)-Settings.plist")
        
        var loadedPlist: NSMutableDictionary
        if FileManager.default.fileExists(atPath: path) {
            loadedPlist = NSMutableDictionary(contentsOfFile: path)!
        } else {
            return nil
        }
        
        return loadedPlist.object(forKey: forKey)
    }
}
