//
//  RandomPhoto.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//


import Foundation

struct RandomPhoto: Codable, Hashable {
    let id: String
    let urls: Urls
    let likes: Int

    enum CodingKeys: String, CodingKey {
        case id
        case urls, likes
    }
    
    init(id: String, urls: Urls, likes: Int) {
        self.id = id
        self.urls = urls
        self.likes = likes
    }
}

struct Urls: Codable, Hashable {
    let thumb: String

    enum CodingKeys: String, CodingKey {
        case thumb
    }
}

// MARK: - Welcome
//struct RandomPhoto: Codable {
//    let id: String
//    let createdAt, updatedAt, promotedAt: Date
//    let width, height: Int
//    let color, blurHash, welcomeDescription: String
//    let altDescription: JSONNull?
//    let urls: Urls
//    let links: WelcomeLinks
//    let likes: Int
//    let likedByUser: Bool
//    let currentUserCollections: [JSONAny]
//    let sponsorship: JSONNull?
//    let topicSubmissions: WelcomeTopicSubmissions
//    let user: User
//    let exif: Exif
//    let location: Location
//    let meta: Meta
//    let publicDomain: Bool
//    let tags: [Tag]
//    let tagsPreview: [TagsPreview]
//    let views, downloads: Int
//    let topics: [JSONAny]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case welcomeDescription = "description"
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case user, exif, location, meta
//        case publicDomain = "public_domain"
//        case tags
//        case tagsPreview = "tags_preview"
//        case views, downloads, topics
//    }
//}
//
//// MARK: - Exif
//struct Exif: Codable {
//    let make, model, name, exposureTime: String
//    let aperture, focalLength: String
//    let iso: Int
//
//    enum CodingKeys: String, CodingKey {
//        case make, model, name
//        case exposureTime = "exposure_time"
//        case aperture
//        case focalLength = "focal_length"
//        case iso
//    }
//}
//
//// MARK: - WelcomeLinks
//struct WelcomeLinks: Codable {
//    let linksSelf, html, download, downloadLocation: String
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, download
//        case downloadLocation = "download_location"
//    }
//}
//
//// MARK: - Location
//struct Location: Codable {
//    let name, city, country: JSONNull?
//    let position: Position
//}
//
//// MARK: - Position
//struct Position: Codable {
//    let latitude, longitude: JSONNull?
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let index: Bool
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let type: TypeEnum
//    let title: String
//    let source: TagSource?
//}
//
//// MARK: - TagSource
//struct TagSource: Codable {
//    let ancestry: Ancestry
//    let title, subtitle, sourceDescription, metaTitle: String
//    let metaDescription: String
//    let coverPhoto: PurpleCoverPhoto
//
//    enum CodingKeys: String, CodingKey {
//        case ancestry, title, subtitle
//        case sourceDescription = "description"
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case coverPhoto = "cover_photo"
//    }
//}
//
//// MARK: - Ancestry
//struct Ancestry: Codable {
//    let type, category: Category
//    let subcategory: Category?
//}
//
//// MARK: - Category
//struct Category: Codable {
//    let slug, prettySlug: String
//
//    enum CodingKeys: String, CodingKey {
//        case slug
//        case prettySlug = "pretty_slug"
//    }
//}
//
//// MARK: - PurpleCoverPhoto
//struct PurpleCoverPhoto: Codable {
//    let id: String
//    let createdAt, updatedAt: Date
//    let promotedAt: Date?
//    let width, height: Int
//    let color, blurHash, coverPhotoDescription: String
//    let altDescription: String?
//    let urls: Urls
//    let links: WelcomeLinks
//    let likes: Int
//    let likedByUser: Bool
//    let currentUserCollections: [JSONAny]
//    let sponsorship: JSONNull?
//    let topicSubmissions: PurpleTopicSubmissions
//    let premium: Bool
//    let user: User
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case coverPhotoDescription = "description"
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case premium, user
//    }
//}
//
//// MARK: - PurpleTopicSubmissions
//struct PurpleTopicSubmissions: Codable {
//    let texturesPatterns, nature, experimental: Experimental?
//
//    enum CodingKeys: String, CodingKey {
//        case texturesPatterns = "textures-patterns"
//        case nature, experimental
//    }
//}
//
//// MARK: - Experimental
//struct Experimental: Codable {
//    let status: String
//    let approvedOn: Date
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case approvedOn = "approved_on"
//    }
//}
//
//// MARK: - Urls
//struct Urls: Codable {
//    let raw, full, regular, small: String
//    let thumb, smallS3: String
//
//    enum CodingKeys: String, CodingKey {
//        case raw, full, regular, small, thumb
//        case smallS3 = "small_s3"
//    }
//}
//
//// MARK: - User
//struct User: Codable {
//    let id: String
//    let updatedAt: Date
//    let username, name, firstName, lastName: String
//    let twitterUsername: String?
//    let portfolioURL: String?
//    let bio, location: String
//    let links: UserLinks
//    let profileImage: ProfileImage
//    let instagramUsername: String
//    let totalCollections, totalLikes, totalPhotos: Int
//    let acceptedTos, forHire: Bool
//    let social: Social
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case updatedAt = "updated_at"
//        case username, name
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case twitterUsername = "twitter_username"
//        case portfolioURL = "portfolio_url"
//        case bio, location, links
//        case profileImage = "profile_image"
//        case instagramUsername = "instagram_username"
//        case totalCollections = "total_collections"
//        case totalLikes = "total_likes"
//        case totalPhotos = "total_photos"
//        case acceptedTos = "accepted_tos"
//        case forHire = "for_hire"
//        case social
//    }
//}
//
//// MARK: - UserLinks
//struct UserLinks: Codable {
//    let linksSelf, html, photos, likes: String
//    let portfolio, following, followers: String
//
//    enum CodingKeys: String, CodingKey {
//        case linksSelf = "self"
//        case html, photos, likes, portfolio, following, followers
//    }
//}
//
//// MARK: - ProfileImage
//struct ProfileImage: Codable {
//    let small, medium, large: String
//}
//
//// MARK: - Social
//struct Social: Codable {
//    let instagramUsername: String
//    let portfolioURL: String?
//    let twitterUsername: String?
//    let paypalEmail: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case instagramUsername = "instagram_username"
//        case portfolioURL = "portfolio_url"
//        case twitterUsername = "twitter_username"
//        case paypalEmail = "paypal_email"
//    }
//}
//
//enum TypeEnum: String, Codable {
//    case landingPage = "landing_page"
//    case search = "search"
//}
//
//// MARK: - TagsPreview
//struct TagsPreview: Codable {
//    let type: TypeEnum
//    let title: String
//    let source: TagsPreviewSource?
//}
//
//// MARK: - TagsPreviewSource
//struct TagsPreviewSource: Codable {
//    let ancestry: Ancestry
//    let title, subtitle, sourceDescription, metaTitle: String
//    let metaDescription: String
//    let coverPhoto: FluffyCoverPhoto
//
//    enum CodingKeys: String, CodingKey {
//        case ancestry, title, subtitle
//        case sourceDescription = "description"
//        case metaTitle = "meta_title"
//        case metaDescription = "meta_description"
//        case coverPhoto = "cover_photo"
//    }
//}
//
//// MARK: - FluffyCoverPhoto
//struct FluffyCoverPhoto: Codable {
//    let id: String
//    let createdAt, updatedAt: Date
//    let promotedAt: Date?
//    let width, height: Int
//    let color, blurHash, coverPhotoDescription: String
//    let altDescription: String?
//    let urls: Urls
//    let links: WelcomeLinks
//    let likes: Int
//    let likedByUser: Bool
//    let currentUserCollections: [JSONAny]
//    let sponsorship: JSONNull?
//    let topicSubmissions: FluffyTopicSubmissions
//    let premium: Bool
//    let user: User
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case promotedAt = "promoted_at"
//        case width, height, color
//        case blurHash = "blur_hash"
//        case coverPhotoDescription = "description"
//        case altDescription = "alt_description"
//        case urls, links, likes
//        case likedByUser = "liked_by_user"
//        case currentUserCollections = "current_user_collections"
//        case sponsorship
//        case topicSubmissions = "topic_submissions"
//        case premium, user
//    }
//}
//
//// MARK: - FluffyTopicSubmissions
//struct FluffyTopicSubmissions: Codable {
//    let texturesPatterns, nature: Experimental?
//
//    enum CodingKeys: String, CodingKey {
//        case texturesPatterns = "textures-patterns"
//        case nature
//    }
//}
//
//// MARK: - WelcomeTopicSubmissions
//struct WelcomeTopicSubmissions: Codable {
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
