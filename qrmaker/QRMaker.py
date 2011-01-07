from pygooglechart import QRChart
import logging
import re
import uuid
import shutil
import os

HEIGHT = 210
WIDTH  = 210

vCardTemplate = '''BEGIN:VCARD
N:{SURNAME};{FIRSTNAME}
TEL;CELL:{TELMOBILE}
TEL;HOME:{TELHOME}
EMAIL:{EMAIL}
URL:{URL}
END:VCARD'''

class QRMaker:
    def __init__(self):
        self._templateData = vCardTemplate

    def createVCard(self, data):
        try:
                logging.debug('In createVCard')
                chart = QRChart(HEIGHT, WIDTH)
                templateData = ''
                logging.debug('Parsing form')
                for k, v in data.items():
                    templateData = self._templateData.replace('{%s}' % k, v)
                    self._templateData = templateData

                logging.debug('Parsed form..')

                match = re.sub(r'{\w*\w}', '', templateData)

                chart.add_data(match)

                chart.set_ec('H', 0)
                uid = uuid.uuid1()
                logging.debug('Downloading image')
                filePath =  '%s/../static/cache/%s.png' % (os.path.dirname(__file__), uid)
                logging.debug('Downloading ' + filePath)
                chart.download(filePath)
                return uid
        except ex:
                logging.debug('Unhandled exception')
                logging.exception('Unhandled exception')

    def generatePermalink(self, id):
        shutil.copyfile(
            'static/cache/%s.png' % id,
            'static/images/permalinked/%s.png' % id
        )
        return 'static/images/permalinked/%s.png' % id

