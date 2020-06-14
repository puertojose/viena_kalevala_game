import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import 'package:viena_kalevala_game/audio_noweb.dart' // Stub implementation
if (dart.library.html) 'package:viena_kalevala_game/audio_web.dart'; // dart:html implementation

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Awards extends StatefulWidget {
  @override
  _AwardsState createState() => _AwardsState();

}

class _AwardsState extends State<Awards> {
  @override
  Widget build(BuildContext context) {
    final title = 'Awards';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.cyan,
//          title: Text(title),
//        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: <Widget>[
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/aino.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.cyan,
                          title: const Text('Aino'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/aino.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                          Center(
                              child: new Text(
                                """Aino
Sisar nuoren Joukahaisen""",
                                style: new TextStyle(
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,

                                ),
                                textAlign: TextAlign.center,

                              )
                          ),
                          new Expanded(
                              flex:1,
                              child: new Flexible(
                                  child: new SingleChildScrollView(
                                      child: Center(
                                          child: new Text(
                                            """“Parempi meressä olla, alla aaltojen asua, sisarena siikasilla, veikkona ve’en kaloilla, kun on vanhalla varana, turvana tutisijalla.”

Aino on nuori, kaunis nainen ja Joukahaisen sisko. Joukahainen lupaa Ainon vaimoksi Väinämöiselle sen jälkeen, kun hän on hävinnyt tietäjälle kaksintaistelussa. Aino ei kuitenkaan halua vanhalle ukolle vaimoksi, vaan kieltäytyy ja juoksee itkien kotiinsa. Ainon äiti on tyttärensä päätöksestä harmissaan. Hän kehottaa Ainoa koristautumaan aitassa kauniisiin koruihin ja vaatteisiin, koska Väinämöinen on kuuluisa tietäjä ja siten mieluisa vävyehdokas. Aino tulee äitinsä sanoista surulliseksi ja lähtee rantaan itkemään kohtaloaan.

Kaukaisella niemellä Aino näkee myyttisiä Vellamon neitoja kylpemässä ja päättää liittyä heidän seuraansa. Aino hukuttautuu meren aaltoihin ja muuttuu itsekin Vellamon neidoksi, eräänlaiseksi merenneidoksi.

Myöhemmin Väinämöinen lähtee etsimään Ainoa. Merellä hänen onkeensa tarttuu erikoinen kala. Väinämöinen aikoo valmistaa kalan ruoakseen, mutta silloin kala paljastaa olevansa Aino. Aino pilkkaa tietäjää, koska tämä ei tunnistanut neitoa. Väinämöinen on häpeissään ja surullinen, kun menetti nuoren morsiamensa toistamiseen.

Kalevalan maailmassa järjestetyt avioliitot ovat olleet tavanomaisia. Vanhemmat haluavat saada etenkin tyttäriään hyville, varakkaille sulhasehdokkaille. Ainon veli Joukahainen yrittää järjestää sisarensa naimisiin, koska on epätoivoisessa tilanteessa – kaulaansa myöten suossa. Vastineeksi henkensä säilyttämisestä hän lupaa Väinämöiselle ensin maallista omaisuuttaan, mutta vanhan tietäjän kieltäytyessä hän viimeisenä oljenkortenaan tarjoaa tälle ainoan sisarensa vaimoksi. Ainoan sisaren Lönnrot päättikin nimetä Ainoksi ja tuli samalla keksineeksi uuden naisen nimen.

Kalevalan Aino on pitkälti Elias Lönnrotin luomus, sillä sellaisenaan Ainon tarinaa ei esiinny vanhoissa kansanrunoissa. Ainon elämänvaiheissa yhdistyy useita runoja, kuten Hirttäytyneen neidon runo, Vellamon neidon onginta, sekä useita lyyrisiä runoja, joissa nuori nainen kuvailee huoliaan. Yhdistelemällä näitä runolauluja Lönnrot loi dramaattisen tarinan, joka inspiroi myöhemmin myös useita taiteilijoita.

Ainon vaiheet on kuvattu Kalevalan runoissa:

3 4 5""",
                                            style: new TextStyle(
                                              color: Colors.black45,
                                              fontStyle: FontStyle.italic,

                                            ),
                                            textAlign: TextAlign.center,

                                          )
                                      )
                                  )
                              )
                          )
                          ],
                        )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/ilmarinen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Ilmarinen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/ilmarinen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                          Center(
                              child: new Text(
                                """Seppo Ilmarinen
Ylen taitava takoja""",
                                style: new TextStyle(
                                  color: Colors.black45,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,

                                ),
                                textAlign: TextAlign.center,

                              )
                          ),
                          new Expanded(
                              flex:1,
                              child: new Flexible(
                                  child: new SingleChildScrollView(
                                      child: Center(
                                          child: new Text(
                                            """Silloin Seppo Ilmarinen rauan tempasi tulesta, asetti alaisimelle, takovi teräkaluiksi, keihä’iksi, kirvehiksi, kaikenlaisiksi kaluiksi.
Ilmarinen on myyttinen seppä, jonka meriitteihin luetaan jopa taivaankappaleiden takominen. Kalevalassa hän on kuitenkin sangen inhimillinen sankari, joka muiden tavoin tavoittelee onnellista elämää ja aviokumppania.

Louhi pyytää sampoa Väinämöiseltä, joka on tullut kosimaan Pohjolan tytärtä. Väinämöinen sanoo tietävänsä taitavan takojan ja lähettää Ilmarisen kuusen latvalla lentäen kohti Pohjolaa. Pohjolassa Ilmarinen takoo ihmeellisen sammon, jonka kolme myllyä jauhavat suolaa, jauhoja ja rikkauksia. Louhi kuitenkin haluaa nähdä Ilmarisen myös suoriutuvan mahdottomilta tuntuvista ihmeteoista ennen kuin lupaa tälle tyttärensä. Ilmarinen on puolisoehdokkaista Pohjolan tyttären suosikki, ja lopulta Louhi suostuu antamaan tyttärensä sepälle vaimoksi. Hääjuhlat kestävät monta päivää.

Ilmarisen ja Pohjolan tyttären avio-onni ei kuitenkaan kestä kauaa. He muuttavat omaan kotiinsa, jonne ostetaan orjaksi nuori mies Kullervo. Kaltoin kohdeltu Kullervo päätyy surmaamaan Ilmarisen vaimon. Seppä Ilmarinen tulee tästä lohduttoman surulliseksi. Surullinen Ilmarinen takoo itselleen kullasta uuden vaimon, joka ei kuitenkaan ole elävän puolison veroinen.

Ilmarinen kokeilee vielä onneaan Louhen nuoremman tyttären kosimisessa, mutta tulee torjutuksi. Hän päätyy ryöstämään morsiamen mukaansa. Tytär ei ole osaansa tyytyväinen ja vimmastuksissaan Ilmarinen taikoo tämän lokiksi. Käytyään Pohjolassa Ilmarinen kertoo Kalevalassa rikkauksista, joita sampo Louhelle takoo. Kalevalan miehet päättävät lähteä ryöstämään ihmekoneen itselleen.

Myyttinen seppähahmo tunnetaan monien eri kulttuurien kansantarustossa. Esimerkiksi Antiikin mytologiassa esiintyy seppähahmo Hefaistos. Itämerensuomalaisissa tarustoissa Ilmarinen on ilman ja tuulen jumala.

Ilmariseen liittyvien kansanrunojen voi päätellä olevan peräisin rautakaudelta, jolloin rautamalmia opittiin jalostamaan käyttöesineiksi. Raudan synty esiintyy useissa loitsuissa, ja sen myyttisen alkuperän vuoksi rautaesineillä on myös katsottu olevan suojaavia taikavoimia. Seppä on ollut se taituri, joka on kyennyt hallitsemaan pelottavaa tulta ja rautaa. Sepät ovat takoneet metsästäjille aseita sekä kaikenlaisia käyttöesineitä aina nauloista patoihin. Tuon ajan ihmiselle tämä keksintö oli niin mullistava, että ihmismielissä alkoi syntyä fantasioita siitä, mihin kaikkeen rauta voikaan taipua. Näin syntyivät tarinat ihmekoneista, kuten sampo, sekä ihmeellisen taitavasta sepästä, joka kykenee tekemään metallista jopa ihmisen.

Ilmarisesta kerrotaan runoissa:

9 10 15 17 18 19 24 25 37 38 39 40 42 43 44 46 47 48 49""",
                                            style: new TextStyle(
                                              color: Colors.black45,
                                              fontStyle: FontStyle.italic,

                                            ),
                                            textAlign: TextAlign.center,

                                          )
                                      )
                                  )
                              )
                          )
                          ],
                        )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/joukahainen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Joukahainen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/joukahainen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Joukahainen
Laiha poika lappalainen""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """”Vähä on miehen nuoruuesta, nuoruuesta, vanhuuesta, Kumpi on tieoilta parempi, muistannalta mahtavampi, Sep’ on tiellä seisokahan, toinen tieltä siirtykähän!”
Joukahainen on itsevarma nuori mies, joka uskoo olevansa parempi tietäjä kuin paljon kehuttu Väinämöinen. Hän haastaa Väinämöisen kaksintaisteluun, jossa mitellään miekkojen sijaan sanoilla.

Kilpalaulannassa tietäjät kertovat vuorotellen asioita, joita tietävät. Joukahainen nimeää lukuisia paikkoja, eläimiä ja luonnonilmiöitä, mutta jää kiinni valheesta, kun väittää osallistuneensa maailman luomiseen. Kun Joukahainen huomaa, että on jäämässä tappiolle, hän haastaa Väinämöisen miekkataisteluun. Väinämöinen luottaa mieluummin sanan mahtiin. Hän upottaa Joukahaisen loitsuillaan suohon, ja Joukahainen pelkää kuolevansa. Joukahainen lupaa Väinämöiselle omaisuuttaan, mutta Väinämöistä eivät kullat tai peltotilkut kiinnosta. Viimeisenä oljenkortenaan Joukahainen lupaa Aino-sisarensa Väinämöiselle vaimoksi. Tästä Väinämöinen ilahtuu ja hän päästää Joukahaisen ahdingosta.

Kun Aino hukuttautuu, haluaa Joukahainen kostaa sisarensa kohtalon. Hän aikoo ampua Väinämöisen tulisella nuolellaan ja lähtee väijymään tietäjää. Hän osuu nuolellaan Väinämöisen hevoseen ja suistaa Väinämöisen mereen. Joukahainen olettaa tämän olleen Väinämöisen loppu ja kerskuu surmanneensa tietäjän, mutta kotka pelastaa Väinämöisen meren aalloista.

Joukahaista kutsutaan Kalevalassa myös nimellä “laiha poika lappalainen”. Lappia on pidetty myyttisenä noitien maana, joten Joukahaisenkin voi tätä kautta ymmärtää jonkinlaiseksi tietäjäksi. Kalevalassa Lappi ja Pohjola eivät tarkoita samaa asiaa, vaan Pohjola on oma, erillinen paikkansa, vaikka lennokkaimmissa tulkinnoissa Joukahainen on nimetty jopa Pohjolan isännäksi.

Kansanrunoudessa Joukahaisen ja Väinämöisen kilpalaulanta sijoittuu jo maailman alkuaikoihin. Joissakin versioissa miehet ovat veljeksiä, Iro-neidon lapsia, jotka riitautuvat ja joutuvat kaksintaisteluun. Hävinnyt Joukahainen (tai nimeltä mainitsematon lappalainen) kostaa Väinämöiselle ja sysää hänet alkumereen, jossa sotka munii munansa Väinämöisen polvelle.

Joukahainen esiintyy runoissa:

3 6""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/kullervo.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Kullervo'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/kullervo.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Kullervo
Kalervon poika""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Kullervo Kalervon poika ajoi lehmänsä levolle, Itse istui mättähälle, otti leivän laukustansa, Veti veitsensä tupesta, leivän leikkaellaksensa, Veitsi vierähti kivehen, kajahutti kalliohon.
Kalervo ja Untamo ovat veljeksiä, jotka ajautuvat sotaisaan riitaan. Untamo hävittää koko Kalervon suvun ja ottaa mukaansa vain Kalervon raskaana olevan vaimon. Vaimo synnyttää lapsen, joka nimetään Kullervoksi. Jo pienenä lapsena Kullervo on yliluonnollisen voimakas ja uhoaa kostoa vanhempiensa puolesta. Untamo yrittää hankkiutua pojasta eroon, mutta ei onnistu surmaamaan tätä. Kullervo ei myöskään osaa tehdä työtä, ja siksi Untamo päättää myydä Kullervon orjaksi sepän taloon. Kullervolla on muistona isästään vain tältä jäänyt puukko.

Kullervo lähetetään paimentamaan karjaa, ja seppä Ilmarisen emäntä antaa hänelle mukaan eväsleivän. Leivän sisään on kuitenkin leivottu kivi, johon Kullervon puukon terä katkeaa. Orpona ja kurjissa oloissa kasvanut Kullervo raivostuu ja ajaa Ilmarisen lehmät suohon. Hän loitsii metsän pedot näyttämään lehmiltä ja lampailta ja ajaa nämä Ilmarisen taloon surmaamaan emännän.

Kun Ilmarisen emäntä on kuollut, Kullervo aikoo lähteä myös Untamon taloon kostamaan. Matkalla hän kuulee perheensä olevan vielä elossa. Hän kohtaa jälleen vanhempansa, mutta kuulee sisarensa kadonneen marjaretkellä. Isä lähettää Kullervon maksamaan veroja, ja matkalla hän kohtaa neidon, jonka viettelee rikkauksilla rekeensä. Kun selviää, että vietelty neito on Kullervon kadonnut sisar, neito hukuttautuu kauhuissaan koskeen. Kullervo lähtee kostamaan Untamolle ja surmaa Untamon väen. Kotiin palattuaan hän löytää tyhjän talon ja huomaa menettäneensä perheensä lopullisesti. Metsässä yksinäinen Kullervo surmaa itsensä miekallaan.

Kullervon tarina on jokseenkin muista Kalevalan tapahtumista irrallinen osuus, jonka Lönnrot yhdisti sopimaan juoneen Ilmarisen ja tämän vaimon kautta. Lönnrot punoi yhteen monia runoaihelmia luodessaan Kullervosta mahdollisimman traagisen hahmon. Kohtuuttoman kovaosainen Kullervo onkin inspiroinut myös mm. Taru sormusten herrasta -trilogian luojaa, J.R.R. Tolkienia, joka kirjoitti The Story of Kullervo -tarinan jo vuonna 1914. Kesken jäänyt käsikirjoitus julkaistiin kirjana vasta vuonna 2015.

Kullervon kohtalosta kerrotaan seuraavissa runoissa:

31 32 33 34 35 36""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
              photo: 'assets/characters/kyllikki.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Kyllikki'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/kyllikki.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Kyllikki
Saaren neiti""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Jo päivänä muutamana, iltana moniahana,
neitoset kisaelevi kaunihilla kankahalla,
Kyllikki ylinnä muita, Saaren kukka kuuluisinna.
Kyllikki on Saaressa asuva nuori nainen, joka on lähtöisin varakkaasta suvusta. Hänen kauneutensa on tuonut paikalle useita kosijoita, mutta Kyllikki ei ole suostunut kenenkään morsiameksi. Lemminkäinen hurmaa Saareen tullessaan kaikki naiset, paitsi Kyllikin – hän on kenties kuullut Lemminkäisen sotaisasta maineesta. Lemminkäinen on kuitenkin päättänyt saada vaimokseen juuri Kyllikin ja ryöstää neidon mukaansa.

Kyllikki pyytää päästä takaisin kotiinsa, mutta Lemminkäinen pitää päänsä. Lemminkäinen kerskuu olevansa mahtava sotaurho, joka tulee vielä saavuttamaan rikkauksia ja mainetta miekallaan. Kyllikki sanoo lopulta, että suostuu vaimoksi, mikäli Lemminkäinen ei enää lähde sotimaan. Lemminkäisen ehtona on, ettei Kyllikki enää kulje neitojen kanssa tansseissa. Kyllikki asettuu taloksi uuteen kotiinsa ja hetken aikaa elämä sujuu rauhallisesti.

Kyllikki ei jaksa odotella Lemminkäistä kalareissulta, vaan lähtee kylille. Lemminkäinen kuulee tästä siskoltaan. Hän käskee äitiään varustamaan sotatamineensa ja valmistautuu sotaretkeen. Kyllikki varoittelee Lemminkäistä ja jää odottamaan tätä kotiin. Myöhemmin Kyllikki huomaa veren valuvan Lemminkäisen harjasta, jolloin Lemminkäisen äiti lähtee pelastamaan poikaansa. Kyllikkiä ei sittemmin mainita Kalevalassa lainkaan.

Kyllikin kohtalo jää lukijalle hämärän peittoon. Mitä hän ajatteli, kun Lemminkäinen ilmoittikin lähtevänsä hakemaan uutta vaimoa? Jäikö tämä suuresta suvusta tullut, useista kosijoista kieltäytynyt nainen lopulta anoppinsa kanssa mökkiä asuttamaan ja odottamaan sulhoaan aina sotaretkiltä kotiin? Ennen kuin Kyllikki ryöstetään, hän vaikuttaa samankaltaisena, itsenäisenä nuorena naisena kuin Pohjolan tyttäret ja Aino, jotka myöskin haluavat itse päättää kohtalostaan.

Kansanrunot eivät kerro Kyllikistä juuri enempää. Hänestä kertovat runot korostavat hänen varakasta taustaansa sekä tyytymättömyyttä Lemminkäistä ja tämän vaatimatonta kotiaan kohtaan. Hänen tehtävänsä tuntuu olevan valanrikkojan rooli ja näin Lemminkäisen sotaretkien oikeuttaja.

Kyllikki mainitaan runoissa:

11 12 15""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/lemminkainen.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Lemminkainen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/lemminkainen.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Lemminkäinen
Itse kaunis Kaukomieli""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Sillä lieto Lemminkäinen, Tuo on kaunis Kaukomieli, Ihastutti Saaren immet, Niemen neitoset lepytti.

Lemminkäinen on seikkailua ja taistelua janoava nuorukainen, joka tunnetaan myös nimillä Kaukomieli sekä Ahti Saarelainen. Hän lähtee vastoin äitinsä kehotusta hakemaan itselleen vaimoa Saaresta. Saaren neidot ihastuvat heti komeaan Lemminkäiseen. Lemminkäinen ihastuu Saaren kauneimpaan neitoon, Kyllikkiin, ja ryöstää tämän morsiamekseen. Kyllikki sanoo suostuvansa vaimoksi, jos Lemminkäinen ei lähde sotimaan. Lemminkäinen laittaa Kyllikin lupaamaan, ettei Kyllikki enää kulje kylillä tansseissa. Lemminkäisen äiti on tyytyväinen miniästään, joka tulee vauraasta suvusta.

Kyllikki ei malta pitää lupaustaan, vaan lähtee muiden nuorten naisten kanssa juhlimaan Lemminkäisen ollessa kalastamassa. Kun Lemminkäinen kuulee tästä, hän lähtee heti Pohjolaan etsimään parempaa vaimoa itselleen. Hän jättää surevalle äidilleen harjan, joka alkaa vuotaa verta, jos Lemminkäiselle käy matkalla huonosti.

Kun Lemminkäinen pyytää Louhelta tytärtä, Louhi antaa Lemminkäiselle tehtäviä. Viimeinen tehtävä on ampua joutsen Tuonelan joelta. Lemminkäisen aiemmin suututtama karjapaimen surmaa Lemminkäisen ja työntää hänet jokeen, jossa Tuonen poika vielä paloittelee Lemminkäisen miekallaan osiin. Lemminkäisen äiti tulee apuun, palauttaa poikansa elävien kirjoihin ja vie tämän mukanaan kotiin.

Lemminkäinen ajautuu vielä moniin taisteluihin, mutta sotaretket eivät tuo hänelle toivottua menestystä. Pohjan neidon hääjuhlaan kuokkavieraana ilmestyttyään hän surmaa Pohjolan isännän ja joutuu pakomatkalle. Lopulta hän liittyy Väinämöisen ja Ilmarisen seuraan, kun nämä lähtevät varastamaan ihmekone sampoa Pohjolasta.

Kalevalan Lemminkäisessä yhdistyy kolme eri kansanrunojen mieshahmoa. Ensimmäinen kertoo Lemminkäisestä, šamaanista, joka matkustaa tuonpuoleiseen kohdaten monia esteitä ja päätyen Tuonen virtaan. Toinen on Kaukamoinen tai Kaukomieli, joka rettelöintinsä vuoksi joutuu pakomatkalle ㄧ tämän teeman Lönnrot otti mukaan Pohjolan häihin. Kolmas hahmo löytyy Ahdin ja Kyllikin runosta, joka kertoo epäonnistuneesta avioliitosta.

Lemminkäisen löydät seuraavista runoista:

1 11 12 13 14 15 20 26 27 28 29 30 39 40 42 43 49""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/lemminkaisenaiti.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Lemminkaisenaiti'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[PhotoHero(
                            photo: 'assets/characters/lemminkaisenaiti.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Lemminkäisen äiti
Loi miehen, uron sukesi""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Tuopa äiti Lemminkäisen, eipä heitä poikoansa; Vetelevi vielä kerran haravalla vaskisella pitkin Tuonelan jokea, sekä pitkin, jotta poikki, saapi kättä, saapi päätä, monta muuta muskulata. Niistä poikoa rakenti, laati lieto Lemminkäistä. Loi miehen, uron sukesi, muinaisille muo’oillensa.

Kalevalassa äidit ovat keskeisessä roolissa neuvojina ja kuuntelijoina. Kaikki keskeiset sankarit keskustelevat äitiensä kanssa. Vaikka sankarit ovat pääosin miehiä, ei heidän isiään juuri koskaan mainita. Lemminkäisen tarinassa äidin tärkeys korostuu muita enemmän. Äiti varoittelee ja neuvoo poikaansa, joka ei äidin puheista tunnu juurikaan välittävän.

Kun Lemminkäinen tuo Saaresta Kyllikin vaimokseen, on äiti hyvillään, koska saa taloon miniän hyvästä suvusta. Hän kenties toivoo, että vaimon myötä Lemminkäisen sotaisa luonne rauhoittuu, eikä tämä enää lähde taisteluihin. Perhe-elämää ei kuitenkaan kestä kauaa: Kyllikki innostuu lähtemään kylille, ja Lemminkäinen saa jälleen syyn sonnustautua sotaretkelle.

Kun Lemminkäisen kampa vuotaa verta kotitalon seinällä, tietää Lemminkäisen äiti poikansa olevan hädässä. Hän rientää etsimään poikaansa ja kuulee tämän suistuneen Tuonen virtaan. Hän pyytää aurinkoa nukuttamaan Manalan väen, jotta pääsee poikansa luo. Rautaisella haravalla hän kokoaa virrasta Lemminkäisen kappaleet ja rakentaa niistä Lemminkäisen entiselleen. Hän lähettää vielä mehiläisen hakemaan voidetta, jolla mies herätetään henkiin. Äiti toruu poikaansa ja vie tämän kotiinsa, mutta Lemminkäinen janoaa pian taas uusiin seikkailuihin.

Lemminkäisen äidillä on hallussaan sanamagia, siinä missä Väinämöisellä ja Louhellakin. Hän puhuttelee taivaankappaleita ja eläimiä ja herättää poikansa kuolleista. Varsinaisessa Kalevalassa on myös pitkä kuvaus siitä, kuinka äiti ottaa eri eläinten muodon etsiessään poikaansa pitkin maita ja mantuja.

Lemminkäisen henkiin herättäminen ei ollut itsestään selvä juonenkäänne: Lönnrotin keräämissä runoissa loppuratkaisuna oli myös Lemminkäisen kuolema tai tämän muuttuminen kalaksi Ainon tavoin. Lönnrot valitsi henkiin herättämisen, luultavasti jatkaakseen Kalevalan juonta ja korostaakseen Lemminkäisen äidin kaikkivoipaa roolia sekä äidinrakkauden voimaa. Äitiys määrittää hahmoa niin suuresti, ettei tätä vanhaa naista mainita lainkaan nimeltä.

Lemminkäisen äiti mainitaan runoissa:

11 12 15 26 28 29 30 43""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/louhi.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Louhi'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/louhi.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Louhi
Pohjolan emäntä""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """”Taiatko takoa sammon, Kirjokannen kalkutella, joutsenen kynän nenästä, maholehmän maitosesta, yhen uuhen villasesta, yhen ohrasen jyvästä?”
Louhi on mahtinainen, joka hallitsee myyttistä Pohjolaa. Louhen muita nimityksiä Kalevalassa ovat Pohjolan emäntä sekä Pohjan akka. Hän on iäkäs nainen, jolla on yliluonnollisia kykyjä: Louhi osaa esimerkiksi muuntautua hurjaksi Kokko-linnuksi ja varastaa taivaan valot vuoren sisään.

Louhen vaikutusvalta perustuu myös hänen omaisuuteensa. Louhella on kauneudestaan kuuluisia tyttäriä sekä ihmekone sampo. Näiden tavoittelu käynnistää Kalevalan keskeiset tapahtumat. Louhi ei kuitenkaan anna tyttäriään vaimoksi kenelle tahansa, vaan kilpakosijoiden täytyy osoittaa taitonsa erilaisissa tehtävissä. Louhea voidaan pitää myös sammon keksijänä, sillä hän saa ensimmäisenä idean sammosta ja alkaa etsiä ihmekoneelle tekijää.

Louhi nähdään usein ennen kaikkea Kalevalan sankareiden vihollisena. Akseli Gallén-Kallela kuvasi kuuluisassa Sammon ryöstö -maalauksessaan Louhen rumana, kotkamaisena eukkona. Tämä on varmasti myös vaikuttanut siihen, millaisena Louhen kuvittelemme. Toisaalta voidaan myös ajatella, että Louhella oli täysi oikeus puolustaa sampoaan, jonka hän oli saanut reilussa vaihtokaupassa myötäjäislahjaksi tyttärestään.

Louhi on yksi monipuolisimpia Kalevalan hahmoja: hän on Pohjolan talon emäntä, hallitsija, äiti sekä lisäksi muotoaan muuttava noita. Tämä johtuu siitä, että Louhen henkilöhahmo on koostettu monenlaisista eri runoista. Taustamateriaalina Louhea varten Elias Lönnrotilla oli käytössään esimerkiksi tautien synnystä kertovia loitsuja sekä kosintarunoja.

Lönnrot loi Louhesta hahmon, jossa yhdistyy paljon negatiivisia piirteitä, kuten ahneus ja kostonhimo. Väinämöinen sen sijaan kuvataan rohkeana ja oikeamielisenä, ikään kuin vastakohtana Louhelle. Kansanrunoissa henkilöt eivät yleensä ole näin mustavalkoisia. On kuitenkin ymmärrettävää, että Lönnrot halusi Kalevalaan selkeää hyvän ja pahan välistä kamppailua.

Pohjolan emännän löydät seuraavista runoista:

1 7 10 14 15 17 20 38 40 42 43 44 45 46 47 49 50""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/marjatta.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Marjatta'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[PhotoHero(
                            photo: 'assets/characters/marjatta.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Marjatta
Piika pikkarainen""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Niin marja mäeltä huuti, puolukainen kankahalta:
”Tule neiti noppimahan, punaposki poimimahan,
ennen kun etana syöpi, mato musta muikkoavi!
Sata on saanut katsomahan, sata neittä, tuhat naista,
ei ken koskisi minuhun, poimisi poloisen marjan.”

Marjatta-niminen piika esiintyy Kalevalan viimeisessä runossa. Hän on paimentamassa lampaita, kun puolukka ryhtyy puhuttelemaan häntä. Marjatta syö puolukan, tulee siitä raskaaksi ja synnyttää poikavauvan. Marjatan raskaus herättää ihmisissä paheksuntaa, koska hänellä ei ole puolisoa.

Isättömälle lapselle etsitään nimen antajaa ja Väinämöinen kutsutaan tuomariksi. Väinämöinen sanoo, että suolta alkunsa saanut lapsi pitää myös viedä sinne ja surmata. Silloin Marjatan kahden viikon ikäinen lapsi alkaa kaikkien hämmästykseksi puhua. Lapsi ihmettelee, että eihän Väinämöistä itseäänkään surmattu aikanaan ㄧ isätön hänkin on. Lapsi ristitään Karjalan kuninkaaksi. Väinämöinen suuttuu, kun tulokasta pidetään suuremmassa arvossa kuin häntä.

Marjatta on Kalevalan vastine Raamatun Neitsyt Marialle, Jeesuksen äidille. Kalevalan viimeinen runo kuvaa Väinämöisen lähdön kautta pakanallisen kansanuskon ajan päättymistä ja kristinuskon saapumista Suomeen.

Kristinuskon vaikutus näkyi kansanrunoudessa pikkuhiljaa. Vanhat, esikristilliset aiheet elivät kansanperinteessä pitkään kristillisten teemojen rinnalllla. Niinpä esimerkiksi synnytys- ja parannusloitsuissa pyydetään usein apuun Neitsyt Mariaa ja mehiläistä. Kirkko ja papit tekivät aktiivisesti töitä sen eteen, että loitsut, uhrilahjat ja muu pakanallisena pidetty perinne saatiin kitketyksi hiljalleen pois uuden uskonnonharjoittamisen tieltä.

Marjatan tarina kerrotaan runossa:

50""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/pohjolantyttaret.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Pohjolantyttaret'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[ PhotoHero(
                            photo: 'assets/characters/pohjolantyttaret.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Pohjolan tyttäret
Neiet kahta kaunihimmat""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Tuo oli kaunis Pohjan neiti, maan kuulu, ve’en valio Istui ilman vempelellä, taivon kaarella kajotti, Kultakangasta kutovi, hopeaista huolittavi.
Pohjolassa asuvat Louhen tyttäret, jotka ovat kuuluisia kauneudestaan. Moni Kalevalan mies haluaisi jonkun heistä vaimokseen. Pohjolan tyttäriä kuvataan kauniiksi ja neuvokkaiksi, mutta heidän nimiään ei Kalevalassa mainita. Heidän olemuksessaan on myös yliluonnollisia piirteitä, sillä Väinämöinen kohtaa ensimmäisen kerran Pohjolan tyttären tämän istuessa taivaan kaarella kutomassa kultakangasta.

Väinämöinen, Ilmarinen ja Lemminkäinen haluavat kaikki vanhimman Pohjolan tyttären vaimokseen. Louhi sanoo antavansa tyttärensä vaimoksi sille, joka takoo hänelle sammon. Louhi haluaa kuitenkin testata miehiä myös monilla muillakin tehtävillä. Pohjolan tyttären suosikkikosija on Ilmarinen, ja hän antaakin Ilmariselle neuvoja tehtävien suorittamisessa. Louhi haluaisi vävykseen mieluiten Väinämöisen, mutta antaa lopulta tyttärensä itse päättää puolisostaan. Pohjolassa vietetäänkin komeat häät, kun tytär ja Ilmarinen menevät naimisiin. Hetken aikaa vaikuttaa siltä, että Pohjolan ja Kalevalan kansojen välillä vallitsee sopu.

Kun Pohjolan neito on emäntänä Ilmarisen talossa, hän leipoo kiven paimenpoika Kullervon leipään. Teko saattaa olla vain harmitonta kujeilua, mutta sen seuraukset ovat kohtalokkaat: Kullervo rikkoo kiveen isältään perimänsä puukon, mikä on jo valmiiksi kovia kokeneelle Kullervolle liikaa. Katkera Kullervo lähettää vihaisia petoja surmaamaan Ilmarisen vaimon.

Vaimoaan sureva Ilmarinen lähtee Pohjolaan kosimaan nuorempaa tytärtä, mutta Louhi ei suostu luopumaan tyttärestään. Siitä huolimatta Ilmarinen ryöstää neidon mukaansa. Ilmarinen kuitenkin muuttaa neidon lokiksi huomattuaan, ettei tällä ole aikomustakaan suostua hänen kanssaan avioliittoon. Kun Kalevalan väki tulee vielä ryöstämään Louhelta sampoa, on tämä ymmärrettävästi hyvin vihainen menetettyään jo kaksi tytärtään.

Pohjolan tytär on Kalevalan nuorista naisista itsenäisin: hän päättää itse, kenen kanssa menee naimisiin, ja on tasaveroinen kumppani Ilmarisen kanssa. Hän pitää neuvokkaasti puoliaan sekä kosijoiden että myös määräilevän äitinsä suhteen. Hääosiossa hän jättää kauniin sanoin ja kiitollisuudella hyvästit lapsuudenkodilleen.

Onkin ristiriitaista, että tästä sanavalmiista ja älykkäästä neidosta tulee Ilmarisen talossa “sepän akka irvihammas”, joka ilman kummempia perusteluita leipoo Kullervo-paimenen leipään kiven. Tämä johtuu siitä, että tässäkin hahmossa Lönnrot on yhdistellyt useita erillisiä kansanrunoja saadakseen aikaan yhtenäisen juonikuvion. Kullervo-runojen ilkeä emäntä ei alunperin ollut se sama Pohjolan neito, jonka kaikki halusivat vaimokseen.

Pohjolan tyttäristä ja kilpakosinnasta puhutaan seuraavissa runoissa:

5 8 13 14 18 19 22 24 32 33 38""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/sampo.png',
              onTap: () {

                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Sampo'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.topLeft,
                          child: Column(
                          children: <Widget>[
                          PhotoHero(
                            photo: 'assets/characters/sampo.png',
                            width: 100.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },

                          ),
                              Center(
                                  child: new Text(
                                    """Sampo
Mikä ihmeen Sampo?""",
                                    style: new TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,

                                    ),
                                    textAlign: TextAlign.center,

                                  )
                              ),
                              new Expanded(
                                  flex:1,
                                  child: new Flexible(
                                      child: new SingleChildScrollView(
                                          child: Center(
                                              child: new Text(
                                                """Kalevalassa seppä Ilmarinen takoo Pohjolan emännälle ihmekoneen, jossa on kolme myllyä. Ne jauhavat suolaa, viljaa ja rikkauksia. Sammon ulkomuoto ja olemus on askarruttanut niin vanhoja runonlaulajia kuin kansanruonouden tutkijoitakin, eikä yhtä oikeaa selitystä olekaan olemassa. Ihmeellinen, rikkauksia jauhava mylly on tunnettu satuaihe ympäri maailmaa.

Kalevalan 10. runossa kerrotaan, kuinka Ilmarinen sai sammon valmiiksi:

Päivän kolmannen perästä
Kallistihe katsomahan
Ahjonsa alaista puolta,
Näki sammon syntyväksi,
Kirjokannen kasvavaksi.
Takoi sammon taitavasti,
Laitahan on jauhomyllyn,
Toisehen on suolamyllyn,
Rahamyllyn kolmantehen.
Sammon toinen nimitys on kirjokansi, minkä on ajateltu tarkoittavan taivaankantta. Ilmarinen on myyttisten runojen mukaan taivaankannen takoja, minkä vuoksi sampokin on liitetty osaksi maailmankaikkeutta ja kosmosta. Sampo onkin ajateltu myös suunnattoman suureksi maailmanpatsaaksi, kultaiseksi tolpaksi, joka kannattelee taivasta, ja jonka huipussa loistaa pohjantähti. Koko taivaankansi tähtineen pyörii tämän huipun ympärillä. Tällainen maailmanpatsas on joissakin runoissa kuvattu myös valtavana tammipuuna.

Sammon toinen nimitys on kirjokansi, minkä on ajateltu tarkoittavan taivaankantta. Ilmarinen on myyttisten runojen mukaan taivaankannen takoja, minkä vuoksi sampokin on liitetty osaksi maailmankaikkeutta ja kosmosta. Sampo onkin ajateltu myös suunnattoman suureksi maailmanpatsaaksi, kultaiseksi tolpaksi, joka kannattelee taivasta, ja jonka huipussa loistaa pohjantähti. Koko taivaankansi tähtineen pyörii tämän huipun ympärillä. Tällainen maailmanpatsas on joissakin runoissa kuvattu myös valtavana tammipuuna.

Sammosta kertovia runoja on Vienan Karjalassa laulettu viljelyn yhteydessä ja se liittyi laulajien mielessä kasvuun ja loputtomaan vaurauteen, joka ammennettiin maasta. Kalevalassa sampo hajoaa mereen, mutta sen kappaleita ajautuu rantaan. Väinämöinen istuttaa niistä viljoja Kalevalan maaperään. Suolaa jauhavan sammon uppoaminen mereen on nähty myös syynä sille, miksi merivesi on suolaista: sampo jatkaa meren syvyyksissä suolan jauhamista ikuisia aikoja.

Sammolle on löytynyt kymmeniä selityksiä ja tulkintoja ja kansanrunojen sammon on ajateltu olevan mm. lipas, kartta, mylly, sammio, noitarumpu, sampi-kala tai onnea tuova ihmekalu. Nykytutkijoiden mukaan sampoa voikin esineen sijaan ajatella yleisenä vertauskuvana onnellisuudelle ja hyvyydelle, joka on saanut runoissa ja tarinoissa eri muotoja.
Sampo mainitaan runoissa:

1 7 10 15 19 38 39 42 43 45""",
                                                style: new TextStyle(
                                                  color: Colors.black45,
                                                  fontStyle: FontStyle.italic,

                                                ),
                                                textAlign: TextAlign.center,

                                              )
                                          )
                                      )
                                  )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ));
              },
            ),
            PhotoHero(
//              tag: 'aino',
              photo: 'assets/characters/vainamoinen.png',
              onTap: () {
                playAudio('test.mp3');
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(

                          backgroundColor: Colors.cyan,
                          title: const Text('Vainamoinen'),
                        ),
                        body: Container(
                          // The blue background emphasizes that it's a new route.
                            color: Colors.white,
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                PhotoHero(
                                  photo: 'assets/characters/vainamoinen.png',
                                  width: 100.0,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },

                                ),
                                Center(
                                    child: new Text(
                                      """Väinämöinen Tietäjä iän-ikuinen
Siinä lauloi Väinämöinen, pitkin iltoa iloitsi. Naiset kaikki naurusuulla, miehet mielellä hyvällä, kuuntelivat, kummeksivat, Väinämöisen väännätystä.""",
                                      style: new TextStyle(
                                        color: Colors.black45,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 18,

                                      ),
                                      textAlign: TextAlign.center,

                                    )
                                ),
                                new Expanded(
                                    flex:1,
                                    child: new Flexible(
                                        child: new SingleChildScrollView(
                                            child: Center(
                                                child: new Text(
                                                  """Väinämöinen on vanha tietäjä ja yksi Kalevalan päähenkilöistä. Hän on yksinäinen mies, joka joutuu monenlaisiin seikkailuihin etsiessään itselleen elämänkumppania. Väinämöinen syntyi aikuisena miehenä ja oli mukana jo maailman luomisessa.

Loitsusanojen avulla Väinämöinen osaa esimerkiksi laulaa kilpailijansa suohon, rakentaa veneen, tyynnyttää myrskyn sekä kukistaa hurjan merihirviön, Iku-Turson. Väinämöinen myös valmistaa maailman ensimmäisen kanteleen jättiläishauen leukaluusta. Väinämöisen soitto on niin ihmeellistä ja liikuttavaa, että sitä saapuvat kuuntelemaan niin ihmiset, eläimet kuin haltjiaolennotkin.

Kalevalan viimeisessä runossa nainen nimeltä Marjatta tulee puolukasta raskaaksi ja synnyttää poikalapsen. Väinämöinen säikähtää, kun vauva alkaakin heti puhua aikuisen tavoin, aivan kuten hän itsekin aikoinaan. Kun lapsi kruunataan Karjalan kuninkaaksi, Väinämöinen lähtee veneellä Kalevalasta. Hän vannoo, että tulee vielä aika, kun häntä taas kaivataan.

Vaka vanha Väinämöinen on yksi keskeisimpiä vanhan kansanrunouden aiheita ja niinpä Lönnrot teki hänestä Kalevalan keskushahmon. Väinämöinen on syntynyt ihmeellisestä ilman immestä, ja hänellä on monia yliluonnollisia taitoja. Hän on silti myös inhimillinen hahmo, jolla on heikkouksia. Väinämöisen vaiheisiin liittyy useita opetuksia, joita Väinämöinen kansalleen kertoo.

Väinämöisen vanhuus tulee usein esille Kalevalan runoissa. Vanhuudesta on hänelle sekä hyötyä että haittaa. Hän päihittää kokemuksellaan nuoren Joukahaisen kilpalaulannassa ja on ikänsä ansiosta arvovaltainen tietäjä. Iäkkyytensä vuoksi Väinämöinen jää kuitenkin myös yksinäiseksi, sillä naimaikäiset naiset eivät halua vanhaa tietäjää puolisokseen.

Väinämöinen ei ole myöskään haavoittumaton. Kun hän veistää venettä Pohjolan tyttärelle, hän iskee kirveellä polveensa haavan. Haava vuotaa niin pahoin, että veri virtaa kohisevana koskena ja peittää maan alleen. Vaikka Väinämöinen onkin taitava tietäjä, hän ei muista raudan syntyloitsua, joka voisi lopettaa verenvuodon. Hän joutuu turvautumaan ulkopuolisen tietäjäukon apuun. Väinämöinen saa lopulta tarvittavat loitsusanat veneen tekemiseen Antero Vipuselta, muinaiselta tietäjältä.

Väinämöinen esiintyy lähes kaikissa Kalevalan runoissa:
1 2 3 4 5 6 7 8 9 10 16 17 18 19 20 21 25 38 39 40 41 42 43 44 45 46 47 48 49 50""",
                                                  style: new TextStyle(
                                                    color: Colors.black45,
                                                    fontStyle: FontStyle.italic,

                                                  ),
                                                  textAlign: TextAlign.center,

                                                )
                                            )
                                        )
                                    )
                                )
                              ],
                            )
                        ),
                      );
                    }
                ));
              },
            ),


          ],

//          children: List.generate(12, (index) {
//            return Center(
//              child: Image.asset('characters2/'+index.toString()+'.png'),
////              child: Text(
////                'Item $index',
////                style: Theme.of(context).textTheme.headline,
////              ),
//            );
//            onTap () =>
//          }),
        ),
      ),
    );
  }

//  void playAudio(String path) {
//    if(kIsWeb) {
//      js.context.callMethod('playAudio', [path]);
//    }
//    else {
//      playLocal(path);
//    }
//  }
//  playLocal(String path) async {
//    int result = await audioPlayer.play(path, isLocal: true);
//  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.text, this.photo, this.onTap, this.width }) : super(key: key);

  final String text;
  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class characterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    child: {
      Hero(
        tag: 'aino',
        child: Image.asset('characters/aino.png'),
      );
    }
  }
}