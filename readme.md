# Church Sermons App

An application for managing and streaming church sermons, events, announcements, and prayer requests. Built with flutter, nuxt.js, Node.js, Express, and MongoDB.

---

## Features
- **Sermon Management**: Upload sermons with audio/video, organize into series, and tag by category.
- **User Roles**: Admins, pastors, and members with tailored permissions.
- **Prayer Requests**: Public or private prayer submissions with status tracking.
- **Donations**: Secure donation tracking with payment integration.
- **Events & Announcements**: Schedule events and post time-sensitive updates.

---

## Entity-Relationship Diagram (ERD)
```mermaid
erDiagram

    User {
        string user_id PK
        enum role "admin, pastor, member"
        string name
        string email
        string password_hash
        string phone
        string profile_picture_url
        datetime join_date
    }

    Sermon {
        string sermon_id PK
        string title
        string description
        datetime date
        string video_url
        string audio_url
        int duration
        boolean is_published
        string user_id FK
        string series_id FK
    }

    Series {
        string series_id PK
        string title
        string description
        string cover_image_url
        datetime start_date
        datetime end_date
    }

    Category {
        string category_id PK
        string name
        string description
    }

    Event {
        string event_id PK
        string title
        string description
        datetime date
        string location
        string organizer_id FK
    }

    Donation {
        string donation_id PK
        string user_id FK
        decimal amount
        datetime date
        string payment_method
        string transaction_id
    }

    Announcement {
        string announcement_id PK
        string title
        string content
        datetime post_date
        datetime expiration_date
        boolean is_active
        string user_id FK
    }

    PrayerRequest {
        string prayer_request_id PK
        string user_id FK
        string content
        enum status "pending, answered"
        boolean is_public
        datetime created_at
        datetime updated_at
    }

    Comment {
        string comment_id PK
        string user_id FK
        string sermon_id FK
        string content
        datetime created_at
        string parent_comment_id FK
    }

    Media {
        string media_id PK
        string sermon_id FK
        enum type "video, audio, document"
        string url
        datetime created_at
    }

    User ||--o{ Sermon : "preaches"
    User ||--o{ Event : "organizes"
    User ||--o{ Donation : "makes"
    User ||--o{ Announcement : "posts"
    User ||--o{ PrayerRequest : "submits"
    User ||--o{ Comment : "writes"
    Series ||--o{ Sermon : "contains"
    Sermon }o--o{ Category : "tagged_as (M:N)"
    Sermon ||--o{ Media : "has"
    Sermon ||--o{ Comment : "has"
    Comment ||--o{ Comment : "replies_to"