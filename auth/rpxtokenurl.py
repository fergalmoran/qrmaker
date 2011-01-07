import logging
import urllib
import urllib2
import json
import pdb

def rpx_response(token):
    api_params = {
        'token': token,
        'apiKey': 'e58e8ad7f740831452c51e3ad40b80eba388a551',
        'format': 'json',
    }

    # make the api call
    http_response = urllib2.urlopen(
        'https://rpxnow.com/api/v2/auth_info',
        urllib.urlencode(api_params))

    # read the json response
    auth_info_json = http_response.read()

    # Step 3) process the json response
    auth_info = json.loads(auth_info_json)
    
    # Step 4) use the response to sign the user in
    if auth_info['stat'] == 'ok':
        logging.debug( 'Signed in succesfully' )
        return  auth_info
    else:
        logging.debug( 'An error occured: ' + auth_info['err']['msg'] )
        return 'An error occured: ' + auth_info['err']['msg']


     
