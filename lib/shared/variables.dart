

//TextEditingController from = TextEditingController();
//TextEditingController to = TextEditingController();
//TextEditingController depart = TextEditingController();
String from='';
String to='';
String depart='';


int travellers = 1;
List<Map> db = [
  {
    'from': 'korea',
    'to': 'Aswan',
    'date': '2022-12-14 23:17:54.652181',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat':
        'A1,A2,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,kkkkkkkkkkkkkkkkkkk'
  },
  {
    'from': 'Alexanddriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    'to': 'Aswan',
    'date': '2025-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswannnnnnnnnnnnnnnnnnnnnnnnn',
    'date': '2020-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2020-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2020-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'trin_number': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2020-01-02 07:12:50.000',
    'price': '250000000000000000000000000000000000',
    'gate': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2020-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2000-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2000-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2000-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {
    'from': 'Alexanddria',
    'to': 'Aswan',
    'date': '2000-01-02 07:12:50.000',
    'price': '250',
    'trin_number': 'A',
    'dur': '1hr-50min',
    'seat': 'A1,A2'
  },
  {'from': 'korea','to':'Aswan' ,'date':'2022-12-14 23:17:54.652181','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,kkkkkkkkkkkkkkkkkkk'},
  {'from': 'Alexanddriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','to':'Aswan' ,'date':'2025-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswannnnnnnnnnnnnnnnnnnnnnnnn' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250000000000000000000000000000000000','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
];
var trian_location_long = 31.233334;
var trian_location_lat = 30.033333;
String googleAPiKey = "AIzaSyBSob1uooRKAkU1SzUjXrxsAeVj-u_OcTc";
