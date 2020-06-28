import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_admob/firebase_admob.dart';
import 'FadeAnimation.dart';
import 'Home.dart';

void main() {


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    // Путь, по которому создаётся Home Screen
    '/start': (BuildContext context) => MyHomePage(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: routes,

    );
  }
}

List<Questions> QuestList = [
  Questions("Вы часто моете руки с МЫЛОМ?", true),
  Questions("Вы часто пользуетесь лифтом?", false),
  Questions(
      "У вас есть какие-либо хронические заболевания дыхательных органов?",
      false),
  Questions(
      "Вы моете руки сразу же после прихода домой и после того, как брали деньги, платежные карты в руки?",
      true),
  Questions("У вас есть диабет?", false),
  Questions("Вы кашляете?", false),
  Questions("В течение дня вы трогаете руками лицо, нос или глаза?", false),
  Questions("У вас есть онкологические заболевания?", false),
  Questions(
      "В течение последних 2-3 недель вы обнимаете на улице друзей или близких вам людей?",
      false),
  Questions("У вас першит в горле или есть насморк?", false),
  Questions(
      "Вы или ваши близкие, которых вы регулярно видите, часто контактируете на работе или другом месте с большим количеством людей?",
      false),
  Questions(
      "Вы часто испытывали положительные эмоции в течение последнего месяца?",
      true),
  Questions("Вы часто болели ОРВИ в течение последнего года?", false),
  Questions(
      "В течение последних 2-3 недель вы контактировали с людьми, у которых обнаружен коронавирус?",
      false),
  Questions("У вас есть астма?", false),
  Questions(
      "Вы иногда или постоянно находитесь в плохо проветриваемых помещениях, где бывают люди с признаками ОРВИ?",
      false),
  Questions(
      "Вы работаете в торговле или другой сфере обслуживания, где видите клиентов лицом к лицу?",
      false),
  Questions(
      "В течение последних 2-3 недель Вы находились в странах, где обнаружен короновирус?",
      false),
  Questions(
      "Вы имеете привычку поправлять или расчёсывать свои волосы, когда находитесь вне дома?",
      false),
  Questions("В вашей местности есть люди, заразившиеся короновирусом?", false),
  Questions("У вас есть сердечно-сосудистые заболевания?", false),
  Questions("Вы беременны?", false),
  Questions(
      "В течение последних 2-3 недель у вас поднималась температура выше 37 градусов?",
      false),
  Questions("Вы старше 60 лет?", false),
  Questions(
      "Вы часто подвержены стрессам на работе, дома или другом месте?", false),
  Questions(
      "В течение последних 2-3 недель у вас были сбои в пищеварении: диарея, например?",
      false),
  Questions(
      "В течение последних 2-3 недель вы продолжаете здороваться с людьми за руку?",
      false),
  Questions("Мытье рук у вас занимает меньше 30 секунд?", false),
  Questions("Вы ведёте здоровый образ жизни без вредных привычек?", false),
  Questions("У вас есть одышка или затруднения с дыханием?", false),
];


class itog{
  String title, text;
  itog(this.title,  this.text);
}


List<itog> itogList = [
  itog("Вы в группе высокого риска","Вы находитесь в группе повышенного риска заражения Covid-19. Вам необходимо срочно обратиться за консультацией к врачу и пройти сначала экспресс-тест на коронавирус, а затем развернутый тест на эту же болезнь. Обязательно самоизолируйтесь даже от своих самых близких родственников. Без промедления соглашайтесь на госпитализацию, интенсивную терапию и реанимационные действия, которые назначил вам врач."),
  itog("Вы в группе среднего риска","Не дожидаясь появления первых симптомов болезни, пройдите тест на короновирус. Следуйте всем рекомендациям врача. От того насколько точно вы следуете указаниям доктора зависит не только ваше здоровье, но и жизнь близких вам людей"),
  itog("Вы в группе низкого риска","В условиях пандемии придерживайтесь правил карантина, установленных государством. В любом случае сейчас значительно сократите количество социальных контактов, избегайте лифтов, не проветриваемых помещений и скопления людей. Продолжайте часто и тщательно мыть руки с мылом, особенно после прихода домой или после общественного транспорта и магазинов. Всеми доступными в условиях карантина способами укрепляйте иммунитет"),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

int count = 0;
int result = 0;
bool block = false;


class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin{

  AnimationController controllerAnim;
  Tween tw = Tween<double>(begin: 1, end: 0);
  Animation animate;
  InterstitialAd _interstitialAd;


  @override
  Future<void> initState()  {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-6057760925873450~5001992858");

    controllerAnim = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animate = tw.animate(controllerAnim);

    _interstitialAd = createInterstitialAd()..load();

  }


//
//  String getAppId() {
//      return "com.google.android.gms.ads.APPLICATION_ID";
//  }



  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-6057760925873450/8258356360",
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }




  Widget build(BuildContext context) {



    return quest();
  }

  Widget quest() {
    //   FirebaseAdMob.instance.initialize(appId: getAppId());
    //FirebaseAdMob.instance.initialize(appId: "ca-app-pub-6057760925873450~5001992858");



    controllerAnim.addListener(() {

      setState(() {

      });

    });

    animate.addStatusListener((status) {
      if(status == AnimationStatus.completed && block){
        count++;
        controllerAnim.reverse();
        block = false;

      }

    });
    if (count < QuestList.length) {
      return Container(
        width: MediaQuery.of(context).size.width ,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: FadeAnimation(
                      0.5, Text(
                        "Вопрос ${count + 1}/${QuestList.length}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: "MPLUS",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeAnimation(0.8,
                       Opacity(
                         opacity: animate.value,
                         child: Text(
                          QuestList[count].text,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "MPLUS",
                          ),
                      ),
                       ),
                    ),
                  ),
                  Opacity(
                    opacity: animate.value,
                    child: FadeAnimation(0.9,
                       Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {});

                                  if (!QuestList[count].inverse) {
                                      result++;
                                  }
                                  block = true;
                                  controllerAnim.forward();
                                  if(count+1 == 30){
                                    http.get("http://eclipsedevelop.ru/api.php/result?res=$result");


                                    _interstitialAd?.dispose();
                                    _interstitialAd = createInterstitialAd()..load();

                                    _interstitialAd?.show();

                                  }


                                  setState(() {});
                                  print("progress $result / 30");
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.green)),
                                color: Colors.green,
                                textColor: Colors.greenAccent,
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Да",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "MPLUS",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12,),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {});
                                  if (QuestList[count].inverse) {
                                    result++;
                                  }
                                  block = true;

                                  controllerAnim.forward();
                                  if(count+1 == 30){
                                    http.get("http://eclipsedevelop.ru/api.php/result?res=$result");
                                    _interstitialAd?.dispose();
                                    _interstitialAd = createInterstitialAd()..load();

                                    _interstitialAd?.show();
                                  }

                                  setState(() {});
                                  print("progress $result / 30");
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(25.0),
                                    side: BorderSide(color: Colors.green)),
                                color: Colors.green,
                                textColor: Colors.greenAccent,
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Нет",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "MPLUS",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      );
    } else {



      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                0.5, Text(
                  "Ваш результат",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: "MPLUS",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(0.8,
               Text(
                 result < 8? itogList[2].title: result < 18? itogList [1].title:itogList[0].title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "MPLUS",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FadeAnimation(1.2,
                   Text(
                     result < 8? itogList[2].text: result < 18? itogList [1].text:itogList[0].text,
                    style: TextStyle(
                      fontSize: 16,
//                  fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: "MPLUS",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FadeAnimation(1.3,
                   Text(
                    "Чем раньше вы начнете делать выше изложенное, тем меньше риск развития тяжелых состояний, не совместимых с жизнью. Особенно это важно для людей старше 60 лет и лиц с хроническими заболеваниями.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "MPLUS",
                    ),
                  ),
                ),
              ),
              FadeAnimation(
                1.5, FlatButton(
                  onPressed: () {
                    result =0;
                    count = 0;
                    setState(() {

                    });
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.green)),
                color: Colors.green,
                  textColor: Colors.greenAccent,
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                      "Пройти тест еще раз",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "MPLUS",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class Questions {
  String text;
  bool inverse;

  Questions(this.text, this.inverse);
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['games', 'pubg'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);