from barcode_database import database

db = database()

healthy = list(db['healthy'].keys())
unhealthy = list(db['unhealthy'].keys())

def fetch_healthy(code):
    healthy_data = db['healthy']
    data = healthy_data[code]
    data['healthy'] = True
    return data


def fetch_unhealthy(code):
    unhealthy_data = db['unhealthy']
    data = unhealthy_data[code]
    data['healthy'] = False
    return data


def main(code):
    code = int(code)
    if code in healthy:
        return fetch_healthy(code)
    elif code in unhealthy:
        return fetch_unhealthy(code)
    else:
        return "Not Found", 404