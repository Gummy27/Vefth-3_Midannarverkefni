from flask import Flask, render_template, session, url_for, request, redirect, json
import urllib.request
from jinja2 import ext
from datetime import datetime
import time

with urllib.request.urlopen("http://apis.is/petrol") as url:
    data = json.loads(url.read().decode())

cheapestBensinPrice = 0 
cheapestDieselPrice = 0
companies = []
for index, entry in enumerate(data['results']):
    if index == 0 or cheapestBensinPrice > entry['bensin95']:
        cheapestBensinPrice = entry['bensin95']
        cheapestBensin = data['results'][index]

    if index == 0 or cheapestDieselPrice > entry['bensin95']:
        cheapestDieselPrice = entry['bensin95']
        cheapestDiesel = data['results'][index]

    if entry['company'] not in companies:
        companies.append(entry['company'])

app = Flask(__name__)

def format_time(gogn):
    return datetime.strptime(gogn, '%Y-%m-%dT%H:%M:%S.%f').strftime('%d.%m.%Y  Kl. %H:%M')

app.jinja_env.add_extension(ext.do)
app.jinja_env.filters['format_time'] = format_time

@app.route("/")
def home():
    return render_template('index.tpl', companies=companies, nr=len(companies), bensin=cheapestBensin, diesel=cheapestDiesel, date=data['timestampPriceCheck'])

@app.route("/company/<name>")
def company(name):
    stations, names = [], {}
    for index, entry in enumerate(data['results']):
        if entry['company'] == name:
            stations.append(entry)
            names[entry['name']] = index

    return render_template('company.tpl', stations=stations, name=name)

@app.route("/station/<index>")
def station(index):
    for entry in data['results']:
        if entry['key'] == index:
            station = entry
            break

    return render_template('station.tpl', info=station)

if __name__ == "__main__":
	app.run(debug=True, use_reloader=True)