from pygooglechart import QRChart
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
                chart = QRChart(HEIGHT, WIDTH)
                templateData = ''
                for k, v in data.items():
                    templateData = self._templateData.replace('{%s}' % k, v)
                    self._templateData = templateData

                match = re.sub(r'{\w*\w}', '', templateData)

                chart.add_data(match)
                chart.set_ec('H', 0)
                uid = uuid.uuid1()
                filePath =  '%s/../static/cache/%s.png' % (os.path.dirname(__file__), uid)
                chart.download(filePath)
                return uid
        except ex:
                logging.debug('Unhandled exception')
                logging.exception('Unhandled exception')

    def generatePermalink(self, id):
        shutil.copyfile(
            '%s/../static/cache/%s.png' % (os.path.dirname(__file__), id),
            '%s/../static/images/permalinked/%s.png' % (os.path.dirname(__file__), id)
        )
        logging.debug('./static/images/permalinked/%s.png' % id)
        return './static/images/permalinked/%s.png' % id

