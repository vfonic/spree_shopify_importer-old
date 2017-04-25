OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(
  :shopify,
  provider: 'shopify',
  credentials: {
    token: 'test_token_blah'
  }
)
