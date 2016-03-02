# allow updates via HTTP GET by setting this to true;
# set to false to only allow updates via HTTP POST
GET_SUPPORT = true

# rate limit channel updates
RATE_LIMIT = false

# number of seconds to wait before a channel can be updated again
RATE_LIMIT_FREQUENCY = '5'

# main production server to handle all requests (can be a proxy)
APPLICATION_IP_ADDRESS = '173.236.253.79'

# domain for the API
API_DOMAIN = 'http://thingspeak.rnoc.gatech.edu/'

# get api key from HTTP headers if this value is present
HTTP_HEADER_API_KEY_NAME = 'THINGSPEAKAPIKEY'

# whether to use Redis or not
REDIS_ENABLED = false

# Twitter api credentials
CONSUMER_KEY = ''
CONSUMER_SECRET = ''

# reset password base url
RESET_PASSWORD_URL = 'http://thingspeak.rnoc.gatech.edu//users/reset_password/'

# allow only these additional locales (use downcase, easier to parse)
ALLOWED_LOCALES = ['pt-br','it']