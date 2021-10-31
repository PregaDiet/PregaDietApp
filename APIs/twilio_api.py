import os
from twilio.rest import Client

account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

client = Client(account_sid, auth_token)

def make_call(name, number):
  # create a xml file
    call = client.calls.create(
      method='GET',
      url=f"https://handler.twilio.com/twiml/EHd4f8236bfbf7cecb6a513907d596363e?name={name}",
      to=number,
      from_='+18508093681'
    )

    print(f"Calling, SID: {call.sid}")



def send_sms(name, number, map_url):
  message_body = f"""
  This is an Emergency! {name} is in trouble. Help her as soon as possible.
  Try to contact or visit her.
  Her location when she hit EMERGENCY button: {map_url}\n
  You have reieved this SMS from PregaDiet because {name} had added you to their Emergency contacts list.
  """

  message = client.messages.create(
    body=message_body,
    from_='+18508093681',
    to=number
  )
  print(f"Message Sent with SID {message.sid}")

def main(name, number, map_url):
  make_call(name, number)
  send_sms(name, number, map_url)