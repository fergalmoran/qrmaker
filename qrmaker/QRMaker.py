from pygooglechart import QRChart
import logging
import re
import uuid
import shutil

HEIGHT = 220
WIDTH  = 220

vCardTemplate = """BEGIN:VCARD
N:{SURNAME};{FIRSTNAME}
TEL;CELL:{TELMOBILE}
TEL;HOME:{TELHOME}
EMAIL:{EMAIL}
URL:{URL}
END:VCARD"""

class QRMaker:
    def __init__(self):
        self._templateData = vCardTemplate

    def createVCard(self, data):
        logging.debug("In createVCard")
        chart = QRChart(HEIGHT, WIDTH)
        templateData = ""

        for k, v in data.items():
            templateData = self._templateData.replace("{%s}" % k, v)
            self._templateData = templateData 

        match = re.sub(r'{\w*\w}', '', templateData)

        chart.add_data(match)

        chart.set_ec('H', 0)
        uid = uuid.uuid1()

        chart.download('static/cache/%s.png' % uid)
        return uid

    def generatePermalink(self, id):
        shutil.copyfile(
            'static/cache/%s.png' % id,
            'static/images/permalinked/%s.png' % id
        )
        return 'static/images/permalinked/%s.png' % id
