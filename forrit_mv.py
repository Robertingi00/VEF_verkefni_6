from bottle import route, run, template, static_file,error, os, request
import requests
reloader = False
response = requests.get('http://apis.is/petrol')
data = response.json()
N1=[]
odyrt_95 = []
odyrt_disel = []
odyrt = []
verd_odyrt = 1000
for x in data['results']:
    if int(x['bensin95']) < verd_odyrt:
        verd_odyrt = x['bensin95']
        odyrt_95 =x
odyrt.append(odyrt_95)



verd_odyrt = 1000
for x in data['results']:
    if int(x['diesel']) < verd_odyrt:
        verd_odyrt = x['diesel']
        odyrt_disel=x
odyrt.append(odyrt_disel)

all_companys_stodvar=[]
all_companys=[]

for x in data['results']:
    if x['name'] not in all_companys_stodvar:
        all_companys_stodvar.append(x)

for i in data['results']:
    add_stod = True
    for j in all_companys:
        if i['company'] == j['company']:
            add_stod = False

    if add_stod:
        all_companys.append(i)



@route('/')
def index():
    return template('sida',odyrt=odyrt,data=all_companys,timi=data['timestampPriceCheck'],odyrt_95=odyrt_95,odyrt_disel=odyrt_disel)

@route('/stodvar/<company>')
def stodvar(company):
    stodvar =[]
    for x in all_companys_stodvar:
        if x['company'] == company:
            stodvar.append(x)

    return template('index', stodvar=stodvar,timi=data['timestampPriceCheck'])

@route('/stodvar/<company>/<stod>')
def stod(company,stod):
    stodvar = []
    for x in all_companys_stodvar:
        if x['company'] == company:
            if x['key'] == stod:
                stodvar.append(x)
    strengur = 209,3
    hnit = []
    for x in data['results']:
        hnit.append('{lat: ' + str(x['geo']['lat']) + ', Ing: ' + str(x['geo']['lon']) + '}')
    return template('sida1', stodvar=stodvar, hnit=hnit,strengur=strengur,timi=data['timestampPriceCheck'])



@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./resources')


@route('/static/<filename:path>')
def server_static(filename):
    return static_file(filename, root='./resources')


@error(404)
def error404(error):
    return template('404error')

@error(500)
def error500(error):
    return template('404error')
run(host='localhost', port='8080', debug='True', reloader='True')
