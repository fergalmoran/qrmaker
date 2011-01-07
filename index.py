import logging
import sys 
import os
sys.path.insert(0, os.path.dirname(__file__))

def initLogging():
	logging.basicConfig(level=logging.DEBUG
        	,format='%(asctime)s [[%(levelname)s]] %(message)s'
	        ,datefmt='%d %b %y %H:%M'
	        ,filename='/tmp/qrmaker.log'
	        ,filemode='a')	
import bottle
from bottle import route, request, redirect, run, template, static_file
from qrmaker import QRMaker
from auth import rpxtokenurl
from model import user

initLogging()
bottle.TEMPLATE_PATH.insert(0, os.path.dirname(__file__) + '/views/')

@route('/favicon.ico')
def favicon():
    return static_file('favicon.ico', root=os.path.dirname(__file__) + '/static/images')

@route('/static/:directory/:filename')
def server_static(directory, filename):
    return static_file(filename, root=os.path.dirname(__file__) + '/static/%s' % directory)

@route('/permalinked/:filename')
def server_static(filename):
    rt = os.path.dirname(__file__) + '/static/images/permalinked' % directory
    logging.debug("Permalink root: " + rt)
    return static_file(filename, root=rt)

@route('/css/:filename')
def server_static(filename):
    return static_file(filename, root=os.path.dirname(__file__) + '/views/css')

@route('/js/:filename')
def server_static(filename):
    return static_file(filename, root=os.path.dirname(__file__) + '/views/js')

@route('auth_proxy', method='POST')
def auth_proxy():
    ret = rpxtokenurl.rpx_response(request.forms.get('token'))
    if type(ret).__name__ == 'dict':
        newUser = user.UserController(ret)
        newUser.generatePermalink()
        return template('qrcode')
    else:
        return ret

@route('/permalink/:id')
def permalink(id=''):
    if id == '':
        return template('qrcode', id='', linkurl='Invalid qrcode id')
    else:
        qr = QRMaker.QRMaker()
        linkUrl = 'Here is your permalink for this vcard <br /> <a href="http://%s/%s">Link</a>' % (request['HTTP_HOST'], qr.generatePermalink(id))
        return template(
            'qrcode', 
            id=id, 
            linkurl=linkUrl
        )

@route('/qrcode')
def index():
    if id == '':
        return 'Invalid qrcode id specified'
    else:
        return template('qrcode', id='', linkurl='')

@route('/:name')
def index(name='World'):
    return template('qrform')

@route('/')
def index():
    return template('qrform')

@route('/genqr', method='POST')
def gen_qrvcard():
    qr = QRMaker.QRMaker()
    uid = qr.createVCard(request.forms)
    return template('qrcode', id=uid, linkurl='')

application = bottle.default_app() 
