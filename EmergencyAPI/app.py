import sqlite3
from flask import Flask
from flask.json import jsonify
from flask_restful import Api, Resource


import aasha
from maps import main as get_hospitals
from twilio_api import main as emergency
from barcode import main as scan

# create app & api
app = Flask(__name__)
app.url_map.strict_slashes = False

api = Api(app)


class Hospitals(Resource):
    def get(self, lat, lng):
        return jsonify(get_hospitals(lat, lng))


class GetAasha(Resource):
    def get(self, region):
        conn = sqlite3.connect('aasha_database.db', check_same_thread=False)
        curr = conn.cursor()
        try:
            name, phone = aasha.get_data(curr, region)
        except:
            return "Not Found", 404
        return {
            'name': name,
            'phone': phone
        }, 200


class EmergencyCall(Resource):
    def get(self, name, number, lat, lng):
        map_url = f"https://www.google.com/maps/dir/?api=1&destination={lat},{lng}"
        emergency(name, number, map_url)
        return 200


class ScanCode(Resource):
    def get(self, code):
        return scan(code)


# Api Resources
api.add_resource(Hospitals, '/hospitals/<lat>/<lng>')
api.add_resource(GetAasha, '/aasha/<region>')
api.add_resource(EmergencyCall, '/emergency/<name>/<number>/<lat>/<lng>')
api.add_resource(ScanCode, '/scan/<code>')

# driver function
if __name__ == "__main__":
    app.run(debug=True)