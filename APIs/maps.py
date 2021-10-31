import os
import requests
import time

from dotenv import load_dotenv

load_dotenv()

API = os.getenv("MAP_API")


def place_search(latitude, longitude):
    # -------- Params for Nearby Search --------- #
    # -------- Fixed Parameters ----------------- #

    radius = 5000  # 5 KM
    type = 'hospital'
    opennow = 'true'

    # -------- Fixed Parameters End ------------- #
    # -------- Params for Nearby Search End ----- #

    # -------- Nearby Search URL -------------- #
    search_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"

    search_url += f"location={latitude}%2C{longitude}&radius={radius}&type={type}&opennow={opennow}&key={API}"

    print(search_url)   # for debugging purpose
    # -------- Nearby Search URL Ends --------- #


    search_response = requests.get(search_url).json()
    return search_response
    

def place_details(place_id):
    details_url = f"https://maps.googleapis.com/maps/api/place/details/json?place_id={place_id}"
    details_url += f"&fields=name%2Cicon%2Cformatted_address%2Curl%2Cformatted_phone_number"
    details_url += f"&key={API}"

    print(details_url)  # for debugging

    details_response = requests.get(details_url).json()
    return details_response


def gen_map(origin_lat, origin_lng, destination_lat, destination_lng):
    url = f"https://www.google.com/maps/dir/?api=1&origin={origin_lat},{origin_lng}&destination={destination_lat},{destination_lng}"
    return url


def fetch_data(results, times, output, latitude, longitude):
    for i in range(times):
        result = results[i]
        if result['business_status'] == "OPERATIONAL":
            time.sleep(2)
            place_id = result['place_id']
            details_response = place_details(place_id)
            
            destination_lat = result['geometry']['location']['lat']
            destination_lng = result['geometry']['location']['lng']

            try:
                rating = result['rating']
            except:
                rating = 'N/A'

            if details_response['status'] == 'OK':
                details_results = details_response['result']
                name = details_results['name']
                address = details_results['formatted_address']
                url = details_results['url']

                try:
                    phone_number = details_results['formatted_phone_number']
                except:
                    phone_number = 'N/A'

                map = gen_map(latitude, longitude, destination_lat, destination_lng)
            
                output['hospitals'].append(
                    {
                        'name': name,
                        'address': address,
                        'phone_number': phone_number,
                        'map': map,
                        'rating': rating,
                        'url': url
                    }
                )
            else:
                continue
        else:
            continue


def main(latitude, longitude):

    output = {
        'status': '',
        'hospitals': []
    }

    search_response = place_search(latitude, longitude)

    if search_response['status'] == 'OK':
        output['status'] = 'OK'
        results = search_response['results']

        if len(results) >= 5:
            fetch_data(results, 5, output, latitude, longitude)
        else:
            fetch_data(results, len(results), output, latitude, longitude)
    
    return output

