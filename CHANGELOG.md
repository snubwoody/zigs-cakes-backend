# Changelog

## 0.7.0

### Added
Added some new endpoints
- `PATCH /admin/cakes/flavor/{id}`
- `DELETE /admin/cakes/flavor/{id}`

## 0.6.1

### Fixed

- Added `DELETE /cart/{cart_id}/item/item_id` to the api docs
  
## 0.6.0

### Added

- Added swagger ui
- `GET /api/v2/cart` which creates a cart and inserts the user id from the auth header
- `POST /order` which receives the cart id in the payload
- `GET /cart/{id}/items` endpoint
- `POST /cart/{id}/item`
- `DELETE /cart/{cart_id}/item/item_id`

### Changed 

- Added `user_id` column to cart
  
## 0.5.3

### Changed

- Added more headers to the allowed headers cors, due to safari rejecting invalid headers.

## 0.5.2

### Added

- Added `utoipa` for autogenerating api docs.
- Added `active_cart` column to the `profiles` table, this is intended to replace the cart cookie due to issues dealing with cookies.

### Changed 

- Changed `secure` to be true on cart cookie.

## 0.5.1

### Changed

- server-core: added response body to logging middleware, on `WARN` and `ERROR` levels.

## 0.5.0

### Added

- db: postgres trigger function to calculate the order price before insert.
  
### Changed 

- server-core: `post_order` now returns the order row.
- server-core: log level now depends on the response status code.
