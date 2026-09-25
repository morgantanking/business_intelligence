# Midwest Airbnb Listings: Data Dictionary

**Dataset:** `listings` table in `midwest_airbnb.db` (SQLite), 14,887 rows and 29 columns
**Source:** Inside Airbnb (https://insideairbnb.com/get-the-data/), the detailed `listings.csv.gz` file for each of three regions: Chicago (snapshot 2026-07-20), Columbus (snapshot 2026-07-23), and Twin Cities MSA (snapshot 2026-07-21). Column meanings follow Inside Airbnb's data dictionary and assumptions (https://insideairbnb.com/data-assumptions/).
**Course:** ISA 401, Miami University

> One row is one listing that showed a nightly price on the snapshot date; listings with no price were dropped. Empty cells are stored as SQL `NULL`.

---

## Field Definitions

| Field | Type | Description |
|---|---|---|
| `city` | text | Which Inside Airbnb region the listing came from: `Chicago` (7,439 rows), `Columbus` (2,587), or `Twin Cities` (4,861). The Twin Cities file covers the Minneapolis-St. Paul metro area, not just the two cities. |
| `snapshot_date` | text | Date Inside Airbnb compiled the file, stored as an ISO text string, not a date: `2026-07-20` for Chicago, `2026-07-23` for Columbus, `2026-07-21` for Twin Cities. Every row of a city shares the same value. |
| `id` | text | Airbnb's listing id. Unique across the table (14,887 distinct values). Stored as text even though it looks numeric, so compare it to a quoted string. |
| `name` | text | Listing title as shown on Airbnb (for example "Tiny Studio Apartment 94 Walk Score"). Never empty. |
| `price` | real | Nightly price in U.S. dollars on the snapshot date, with the dollar sign and commas removed. Ranges from 2.56 to 11,412; never `NULL` (rows without a price were dropped). |
| `room_type` | text | Airbnb's four listing categories: `Entire home/apt` (11,652 rows), `Private room` (2,951), `Hotel room` (246), or `Shared room` (38). |
| `host_id` | text | Airbnb's identifier for the host. There are 6,970 distinct host IDs in the table. Stored as text even though it looks numeric, so compare it to a quoted string. |
| `host_name` | text | Name of the host as shown on Airbnb. There are 3,327 distinct host names; 25 listings have a `NULL` value. |
| `host_since` | text | Date the host joined Airbnb. This field is unavailable in this course dataset and is `NULL` for all 14,887 listings. |
| `host_is_superhost` | text | Indicates whether Airbnb identifies the host as a Superhost: `t` for true and `f` for false. There are 25 `NULL` values. |
| `neighbourhood` | text | Listing neighbourhood, taken from Inside Airbnb's `neighbourhood_cleansed` field. There are 119 distinct neighbourhoods across the three regions. |
| `latitude` | real | Latitude coordinate for the listing. Values range from 39.88 to 46.24 across the three regions. |
| `longitude` | real | Longitude coordinate for the listing. Values range from -94.53 to -82.78 across the three regions. |
| `property_type` | text | Detailed Airbnb property classification, such as an entire rental unit or private room in a condo. There are 62 distinct property types. |
| `accommodates` | integer | Maximum number of guests the listing is designed to accommodate. Values range from 1 to 16 guests. |
| `bedrooms` | real | Number of bedrooms reported for the listing. Non-missing values range from 1 to 16; 2,976 listings have a `NULL` value. |
| `beds` | real | Number of beds reported for the listing. Non-missing values range from 1 to 32; 668 listings have a `NULL` value. |
| `bathrooms_text` | text | Text description of the listing's bathroom arrangement, such as `1 bath`, `1 shared bath`, or `1 private bath`. There are 32 distinct values and 71 `NULL` values. |
| `minimum_nights` | integer | Minimum number of nights required for a booking. Non-missing values range from 1 to 365 nights; 15 listings have a `NULL` value. |
| `availability_365` | integer | Number of days the listing is available during the next 365 days, according to the Airbnb calendar captured by Inside Airbnb. Values range from 0 to 365. |
| `number_of_reviews` | integer | Total number of reviews recorded for the listing. Values range from 0 to 2,246. |
| `number_of_reviews_ltm` | integer | Number of reviews received during the last twelve months. Values range from 0 to 1,220. |
| `first_review` | text | Date of the listing's first recorded review, stored as an ISO text string. Listings without reviews may be `NULL`; 1,761 listings have a `NULL` value. |
| `last_review` | text | Date of the listing's most recent recorded review, stored as an ISO text string. Listings without reviews may be `NULL`; 1,761 listings have a `NULL` value. |
| `review_scores_rating` | real | Airbnb overall review rating for the listing. Non-missing ratings range from 1.00 to 5.00; 1,761 listings have a `NULL` value. |
| `reviews_per_month` | real | Average number of reviews the listing receives per month. Non-missing values range from 0.01 to 77.72; 1,761 listings have a `NULL` value. |
| `instant_bookable` | text | Indicates whether the listing can be booked instantly without host approval. This field is unavailable in this course dataset and is `NULL` for all 14,887 listings. |
| `estimated_revenue_l365d` | real | Estimated listing revenue during the last 365 days, in U.S. dollars. Values range from $0 to $1,114,800. |
| `amenities_count` | integer | Course-created field equal to the number of items in each listing's `amenities` list. Values range from 0 to 100 amenities. |

