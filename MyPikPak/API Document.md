#  PikPak APIs

## Sign in

**Request URL**: https://user.mypikpak.com/v1/auth/signin

**Request body**
- client_id: "YcrttD06T9PIkqAY"
- client_secret: "A3zfcmfNEeyTH0pX2k4GNg"
- username: 
- password: 

**Response**
- <a name="Authorization_token_type">token_type</a>: "Bearer"
- <a name="Authorization_token">access_token</a>: use for authorization
- refresh_token: ??? 
- expires_in: 7200
- <a name="userId">sub</a>: userId that will be used later

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
