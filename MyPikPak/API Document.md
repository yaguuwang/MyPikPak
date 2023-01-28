# PikPak APIs

## Sign in

**Request URL**: https://user.mypikpak.com/v1/auth/signin

**Request body**

- client_id: "YcrttD06T9PIkqAY"
- client_secret: "A3zfcmfNEeyTH0pX2k4GNg"
- username:
- password:

**<a name="Sign_in_response">Response</a>**

- <a name="Authorization_token_type">token_type</a>: "Bearer"
- <a name="Authorization_token">access_token</a>: use for authorization
- <a name="Refresh_token">"refresh_token</a>: token used to get the access_token refreshed
- expires_in: 7200
- <a name="userId">sub</a>: userId that will be used later

## Auth token

> usage: once user already logged in using the sign in endpoint, use this endpoint to refresh the access_token

**Request URL**: https://user.mypikpak.com/v1/auth/token

**Response**: same as [sign in response](#Sign_in_response)

- client_id:
- client_secret:
- grant_type: "refresh_token",
- refresh_token: [refresh token](#Refresh_token)

## Me

**Request URL**: https://user.mypikpak.com/v1/user/me

**Request header**

- Authorization: [Token type](#Authorization_token_type) + [Authorization token](#Authorization_token)

**Response**

- sub: [userId](#userId)
- name: user name
- email:
- password: "SET",
- created_at:
- password_updated_at: