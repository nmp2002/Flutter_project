import 'package:bookingapp/widgets/featured_item.dart';
import 'package:bookingapp/widgets/recommended_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List locations = [
    "Sofitel Legend Metropole",
    "Movenpick",
    "Melia",
    "The Oriental Jade",
    "Hilton Hà Nội Opera",
    "Sheraton Hà Nội",
    "Elegant Suites Westlake",
    "Pan Pacific"
  ];

  List roomItems = [
    {
      "title": "Classic room",
      "type": "Queen Room",
      "price": 180,
      "rate": 4.0,
      "imageUrl":
          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYWFRgVFRUYGBgYHBwYGBgaGBgYGBgZHBoZHBgYGBgcIS4lHB4sHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhIRGjQhISExMTQ0MTQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDE0NDQ0NDQ9NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAEAAIDBQYBB//EAEgQAAIBAgMDBggKCQQCAwAAAAECAAMRBBIhBTFBBiJRYXGxEzJScoGRodEjM0JTkpOywcLSFCQ0YnOCorPwFUNj4QfTFsPx/8QAGQEBAQEBAQEAAAAAAAAAAAAAAAECAwUE/8QAHxEBAQEAAgMBAQEBAAAAAAAAAAERAjESIUEyUUID/9oADAMBAAIRAxEAPwAZjoYyj4i+aO6PbceyMpeKvYO6cXZo8MvMTzF7hHqSpupse/tj8GvMTzF7hJGSET0MUG6jxHuk4eVbpxGhG4yahiL6Nv8AYf8AualTFgHizSANHZpUTXivIs0WaBLeOzSDNFmgT5os0gzRZoE+aLNIM07mgTZos0hzRZoE2aLNIc0WaBNmizSHNOZoE+aLNIM05ngTXnM0izzmeBMWjS8iLzheBIzyHEYhUXMxsPaT0AcT1QfGY1UGupPiqN59w65Ul2ds7m54D5KjoX37z7BFS4mu1TVtFGqp3F+k+wde+GciXviR5j9ywQJp6IRyG/aB/DfuWS/qL/mtByZH6rTt0HvME2h8Y3o7hDeTQ/Vk7D3wPaI+Eb0dwmmQs5O2ikVkuB7I2l4q9g7p3hOU/EXsHdMtNbgF+DTzF+yIQUjNnj4NPMT7IhOWaZCOkFq05YusGqLIBV2iEZUf5V7PwFraN698sxMvygFin834ZJsDFuEYEkqpUKOi4O7q0lg0k4YPnfyfaIs7eT7RKghxbo9BB9ojc0HLt5PtE4Xbo7oBGaczQcu3R7ROZm6PaIBOaLNBrt5PtEVm8n2iATnizwfI/k+0Tvg38n2iBPnizyDwb+T7ROFH8n2iARnizwbI/k+0TmR/J9ogE+Ejk10BHpIX2kwXI/k+0Rwpv0e0QqbPFmkYpP0e0SQU38n2iQKxMbXQhGa4uqkj0AmSeDfyfaINii2VwdOY32TAztG7HOxux3k9w6B1SyopBcImgllTSUdy6HsneRHx4/hv3CPK6HsMXIofrA8x+4TN/UX/ADV/ybH6snZ98D2j8Y3o7hDuTo/Vk7PvgW0fjG7B3CaZBxR0Uisiq6TiDmL2Duk1JLgxBLIvYO6Yba3Zw+CTzE+yIUVg+zh8GnmL3CGBZtzQOsgqLC2WQOsDL8p1PMt+9+GR7AU5Kl+lbeowzlEuqfzfhjNhLzH7V7jEUttviRUtSNTJlHiUw4vc31yHXdxlca2M6a/1I/JNjc9PdOEH/AJpljvDYzpr/Uj8kb4bGdNf6kf+uazEOwtY8ege6MFRun2D3RpjLeGxnTX+pH/ri8NjOmv9SP8A1zVZz0+we6dzN0+we6NMZUVsZ01/qR+SOFbGdNf6kfkmozt0+xfdF4RvK9i+6NMZkV8Z01/qR+SLw+N6a/1K/kmm8M/lexfdGnEP5X9K+6NMZ3w+N6a/1I/JOeHxvTX+pH5JpKmKdaD1L3KByNF4DTS1oCm0qvFh9FfdGmKjw2N6a/1I/JOeGxnTX+pH5JdjaD+UPor7p39Pfyh9FfdGmKPw2M6a/wBSPyRwrY3pr/Uj8ku/09/KH0V904+0nAuWH0V90aYpxXxvTX+pH5I4V8b01/qF/JLTZm2HqVgnySGN8q2uttL+nhL4X/y0mrjObGq4k1lFQ1cnOvmpBV8U2u2QW1txltj18fzG+zDwT/gEExmoc/uN9kwKLCpoJYU1guGTQQ5FhSZdD2HujORY+HHmP3CTOND2GR8jfj18x+4TN/UX/NX3J/8AZqfZ98B2l8Y3o7hLDYH7MnZANpfGN6O4TVZCRTsUis/gEzXnMTTsq9g7oTycs1TIeI0ku36eQqvGw7pj62utmj4NPMX7IhoED2Z8WnmL9kQ5ROkc0bCQOIU4kLiBm+UK6p/N+GM2GvNftXuMI2+mqfzfhjdirzX7V7jJO1+LlViKSUCcYTaK3amINNA4GY3t6+Mqam3WFro1iQL6byQPvllygS9LTyhKnwTLlYgWD0zawN+em+SkT1dsFQTkJtwFtYl2q5/2X+kn5pYbTqg0m0X5N7KPLXqhr4hR8lPoj3THlf4uKhMc5t8E+v7yfmk2ep8y/wBJPzQvxyDoNBoBYaMeHplktTXcOPAdU0iiao4K5qTKGJUElCLhS1tD0KY4t1S0x760msNHPD/jcffIq+KA+Sv0RJbf4uBqq/q1TzX7pWkiW1U3w1Q9Kv1cJ5imLrEX8K/rlRtwwnCwmMOJr/OP7PdI6uKrD/cb2QraloC4Lsczc0Eiw3tbQ36B3+yZpXqWB8I/D5R6IypWqg2Dtw4336mTRt9jAfpCAcEf0aLNVlnnnImo7YnnsWsj2vw8WeiqJUILKLbFYguoY7jzAculhdnYa252gFvFO+aACZvarhatS5AJQqubicrHTrspiB2GWGoJBQWFLA440PYe6D8jvj18x+4Qpxoew90G5HfHr5jdwkvcan5rQbA/Z07IBtL4xvR3CF7JrqmGplr6jSwvAMXWDuXW9jbfpuFpayHtOznpikVha+0XpfCIbMmqm19RKujynxNdi9RkJK30SwFrWAF4VtQcx+w90zWxzofN90cYcq9u2M96NIneUQntKgy0QSq2IPgKP8NPsLLdBKhriQuISwkDiBRbWS70h0lh9mcwCZWqr0Fe4yDlPizSNJwtyrMQL23ZTKvk5yiOIrOpphM93uHvawuFAyi+/f1RJ7LfTaKvdOESRRFaaRV7ZTmDzhB8VSAp308anx/5ElhtBbqo3XYC/Rc2vANqOBQYgEc5LXNzo6dXWJlVftbQXzka+LcW1ZbC1tdRLB30Gt7XvMpjxmuS3EG2vBhNDTYZB7zAlwlXn24Zfxf9zRUVuQd+h+6ZnA84m630Ivx8YTR4anz0W7AEtcix0Ck8QeIEsQRjqQ+DH75/t1PdKjHU/wDuXeNVc1MZ3PPtvS4vTqW+T1St2lSyuVuxGVG1tcEl7jmgeSIwlCkfqz+a/wBmedYDDXt2junouJ0wtU/uP9mY3ZSWt6O6Z5NcRj7NGQm3RM/j8NY+ibFqnNPolBtVN8zGqrESwHYIThMJnYG2+33SMj7pabMIAB6/vgWWwcLkxS9aP+CbDLMxsh74lPMqfgmpImuPTPLs0CZvlBQuxe18jgnsyEfiM0spdr1VyV1uMygMRxAZSqH0lW9U1O2azW1OVqUHekKbu6WB1CpcqGFjqToRwlLieWmJfRAlMdS5m9baeyVfKofrtfzk/tpA8OlzaMNbjkVjKlR6zVHdzk+UxIGp8Vdw9E03I749fMbuEynIADNVtfxNb+cZq+R3x6+Y3cJnl+o1OqMov8BTHQntJPuEGpHT0nvkyrlpoOhRfttrIMOeb6T3mT6HX/zSdiilGc2fhUdwrqCu9hbeOidx2BRHyoihCAQthYAjd6xH7PaxLdUfiXzBD+6O6Y+tNPstfg0sLDIug3DmiWKiAbMHwaeYvcJYLOkYpESCoJOZE4gZblZhS/g1UgElgL9JyiUvJXYb0azMzKcgZGAvv3aHiObNNtrx6R6CT6ss5s0Xaoelh3GJ2XpdARWjrRETSK7a7WQbtWsdAdJXbSJNAlmLXKam9/jF98s9sDmDhzhK3agthzrxT7aSVVBj0A6Bqfu90tnayjt1lRj8PmBe4zc0cLjXTXfxlpiQAPTIObNcZ29/Wu+anD1/hEHEl7HhfI3umP2U/ObQcdfSs0LVGV1KgErmNiSAbjKdRu8aGVpjxd0UHU1LE9HwVXdB9qm1Qi97IgJO82L6mDYjGPnpnIl/CFvHY6mnU0Om605iaju5dwBdVUBTfQFj+KaWGY39kreY/wBkzHYNrBf84TYY79jreY/2Z57smrfMLm4c9Mxyi8V+1TQ9o74BjDcGPZ9D2/fIMQ3dMthn++FYN7Kvb+KBn75JQbmjtPfKjScnXviV8x/wTYPMRyVa+JHmP+Ca7aGNFMLdWYsQAFBPEAk23AA39E1OmeXYyhRzcbAdUz23dkstZq5dPBvTNFw10IdWzIRfeL5l/mFryzTGKWdMzrlZQCL2LnUD2Dug3PaimapmHPOurNYMdW7Qf8tZuVMeT8qh+u1/OT+2kCw3jegw7lUP12t2p/bSV9NrG4moja/+Pl51YdC/iM1HJEkVQQLnI9us2FpmP/Hhu1bzfvmq5Hj4dfMbuExy/Ubn5o5qLugZFLKdx3X9cAwrc0jirOp6mViGHrBmi2J+zp2TOYbfU/jVv7jxmJqaKKKFZui1h6I5DdE7B3CRruj8P4idi9wmG2x2YPg08xfsiWCwHZvxaeYvcIaDOkc6RkbSQC+6JsO43r3QM7t/en834Y3Y+5+0dxhfKDBvZXC3Vb5iOANtT1aQTYjAq9jfUdxj6vxfgThj7RrTTKs23VVKYZr2DC9hc+qZ7aG2KLoURmLEpoVI/wBxTv8ARLHltizTwxcIr89BZwCNWAvYjW2+YDZ7M7hiOcSpIUWUc8bhuAkpGhxZAV/QeniLQ16l0Xde+toJiaDlGuLDS+7pHrlglGwA5tusdsqh9krq3p71mgzc9b7jcesqJUYNVvclR42g/l1MsEALpZtcwsLMT46dUIs8TgwHpWPyzw/46h+6CYp9SOgkE7uMu8ZROejp/uN/ZqzJ48/C5db+EcW3X0JGnpkpFhjf2Kr5j/ZMwOEWw1JOul+AsTYdWpnoGJX9SqAi3wb/AGZgqY3do7pKsSM2+R1zrHtx7ZHVmWg5PvjqJ5o7T3xvD1RU/FHp74FnsjaHgHarkL5Ubmjecz0132NvGv6IbtHlEtdAVJpuCRlzndlNmJAHEj1Sqwf+55n/ANlKQ48XqIC6qCny2yqDnPHgTaaiVp8DtxBfOR8m1yLkWYb/AEgzlDaZZ3dMPUanZxnUoUXPbWxYW9XCVNHZzMnOC6eIynMCOg6btb+vpl5skMmGqU2Au1rW3W48JmTPq32wXK6mRjKxIYAlLGxsfg0Gh3HWVqoRvBHonuyojbmB6jp7DIq2xqT+PRptfpRT7bTU5MWMH/49AvW8wd5901fJL49fMbuELo7HpUs7U6YQstja9iBe2l7QLkgfh18xu4SXuNTqtBsX9nTsmcwx1qfxq39x5o9i/s6dkzOHfWp/Grf3HlvTM7EWE7Is8UjSkWnoeyTYKldE81e4R5XQ9kfgfi08xfsiTF1psCvMUfujuhGwsSlVCGAz02KPpbUbm6NVIPpPRB8AeYvmjulbRx/6NjsraJiAFudAHW+X1g29U1GK1xojgJn8fiq6uUz5AdVOVTzeFiR2+qaRZUco1VU8IxChDmJJsAvH7j6DJ/0lvH16a4WTl7ZCtRYEl+fc3bN8o8T2yJqZS1SmbHeOi3FSOI90t65BW5tu9nT9/ZBsLs6o6sEWwJ0Z7qvG5HEjduE87jOd5eu4+y3jJ7XeCxyOiuGUXGoJAII0I9YkrVk8tPpCB4HYARMrOWNySQABrbQA36JytyeRmBZ6hUG+S6BD1NZbkemelNz2+K5voPyhpUnpqlYnI7qAV8o+Id9jraC4Pkjh1AIqVdLHQUwNDfdbqlptnYi4in4N3dAGVwUKhgUIK2zAjeOiFUsOUFgb9u/2TSAG5O0CCC9XXf4nuk/+h0fLqf0+6A7Z22ad0QBn46HKnb0nq9fRM+dt4r5w/QT8sl5SGVq6fJ+ipJD1DfpK9XV1SX/R6d1bO/NN/k+3SZGntnFH/cP0U/LDaOMxTf73oyp+WTyhlaeps5GKnM/MOYbt+Vl106HMotrbNRHRs789zc6aAISSN3QI5auJ05/bzU905iMBUq5fCOWtcjcAL6HcBHlDEzPfAVD/AMb/AGTMWq7v84T0XCbHz4VqQcjMHQki+W9xe2l9CDMfjdhim5Rne43G62I4Eaf5aKsqpYb4yr90sTs5PLf+n3SN9np5b+tfdJi6qfkiKh4o7T3w47OAFvCN6k90ZSwiABSz3ubG62bW+lha/SN4jBHhK4u6kEMVygaEH4RGvfhop0g21xd1Ui4yA6HjnaS4/DKhVgWN9NbEqQRYiQVmOYNuYLlBNueN7AA7teO7WakZ0DgMO6nNTd04llJQfzWNjN7yextRsLVqVD4R6dstwq5h0HKPbMimOU816VxroOZbW3yTb2TW7D2jTbDVqYTISuZUO4hbZrEbyLg66xyiyrhcUvFWQ+sQ7A4tBfO7cMpQ2PG9xbskS0QeEY+DHRMZY16H1sXTIstVzfQgqhPdI9lbPVGz0Va4BW7HSx36FpU4nCc026DaVvJTHYqrU8GlXJzWe+XOpy20ysdL33iXffRnptMPmpIEy6LoNdbdfCYsVrNU4fC1Tb+dpZYPbuJqU1qthw6NfVGyuLb7oSb+iZzbO16XOcs9Mg2IZdxvaxAvrfSNTFn+kRTI/wDyRPnlP8je6KBrKr809hkWGf4NPMX7IlE2KdukDp/6l1srwaKudg5AG/Nl3aDLce28K1mz6nMTzV7hBNv8mzjFALZFuDnFmbdrlAOnpj6W2VAGVUB3DKpvu4Af9CSfp9VrFHyLxBVWJ7PJ7Ne2XGV1sqg9KmlNmapkAUO9s7AC3OsLE9ckxODSoLVEVx0MoYa79DK2liXOisxPafbLnCIVHOYsTvub+qaiUFh9kU0tkpgW3DUqtt2VSbD7oaKR6IQGjw0SSdFtvYXwR6IvBHoheaLNKgPwHVK/aoZVCpdWb5Q3hRa9us3A9cu7yt2qRmTqBPtEzeiMx/o9+G+OGxwOEu1I9EcCOuYyNap6exh0Q2ls23CWSER4IlxNBjCnqjjhTbfC1aPEYpuyqRGdTuurD0gg/ZEqOWGzrqKqi5TRutDx9B9hM0GC8Z/5fxQh0DAqRcHQg8RNSemd9vJGXqPfONTv0x9fAWqvTV2IR2Uc47gSBOps49Les39czreBjS0kTYUHoBOl7Eq1twcDXTgwsR0yzTZZ0uTfrY3tJv8ASgflH1mNMZ3EYW6OG0ZUzKjHn3zpqjDR1tmFxY66jjKihUGUgsRuG83G/eevSbPE7KUrlYXG8XJNuzo7RKY5cOrLUQLa7o/FkYHKCTv1PTfQTXGpyihqEl2UMwC2GlyLjeba79PXCUpsyXBqXALXUMVANgASPF3nXrA46FbE2mqqgyEqpZ3tTcmoWNrXHELa2oFwpuJZUMfbKEpVMqKxCeAGVi1syMx3C3RcCw0OoN1ADY2tQyVl8KMmQ1FYuUdTow57EXLXFwNCpsSLz0ShiFdVdTdWAZT0gi4Pqnny1ar3p08NUY0QVZB4EC7g5lfN8k2tYWNieiX3Id6n6IBUAGR3RBe5Cgi4bsYtbqtJSNJUsQew90p+RdO2IU/8b9wlir6N6YHyOPw6+Y/cJm9xv5VxyeoWwqDqmdo0VIqKyqw8NW0YAj4x+ma3Yg/Vk7JmKG+p/Grf3HlsZnYM7Hw3HD0Pqk/LFLC05MqpjyLC+PiT/KnveNq8naCC7Vah9Ki/YACZLW5QU2NlqIo6Sbt7hIjtHDjXwisekkmZtrckVmCRFd86uygjJzze2twwBHVLnZ2Lpq3NRlvodSxI6NWlBVxQLkqRYw3A1rneNN8s36lx6Js7HJYWU+oe+Pq8o8OjZWcAjhYn2i/RMYMUxGUHKvHpI6z93fM/Vr52LdJ07BoPZ3zXkz4vU15T4b50epvdHjlPhvnR9F/dPLKcJRZPOnjHpn/yfC/Oj6L+6IcpsN87/S/unnCrJVjzqeL0McpcN86Pov7pA20UrO3g3zBQAdCLG5PETDBpPh8Q6ElHK3tfQEG27QiPLTxbYC4jkEyS7RrfOn6Ke6OXaNX50/RT8smmNigkkyiY+r8630U/LJ1xtX51vop+WXTGmEcO2ZtcXV+db6KfljxiqvzrfRT8saYvRj0pvZjbOtxoT4p13D94SHae3lSm7U+cwUkXFhfhv4SkZmZszuWNrC9hYb9AAJDjz8G/mmPKnizmEdg4Ym5JJbdrfUmaqiARe0yy0DfKN/pl5gGdRlZd3T0dcNLCoRxHZbeJA76XtqP8vEEbo9s5Vok+KbEe3qhAeNrZUdtLKrNbTgCZnsY7tQw4qMWZ3Qa+Rc2Fh1FZb7bp/BZBo1R0QdrNrb0AyLHUgcThaY3IHcjqAGX2rNRK62H3m3q1B7RDcNh1I3Cx3jfH1QoNwy9l/unDiRbRT2zDai5KI9PE47wahlFRAUJsxGUkZWPEX3H2Q3kjib0qqmwZazkrxF8p3dFyR6IBsqqyVsUwHjVFv6EEE2cEz4kMSrCqXV10ZSwvoejqm9ZxpTirFh0gx3It74hf4b9wmTxu0HQ885h5ai30l4eiE8jdvpQrh8Q+VMjqGCs/OOWwsoJ4GZ+xflej7Ce+GTsmcoHWp/Grf3Hh/JXalN6C01dS6DnpezDrsd46xpK2gdan8at/cearM7TX64pzPFMq8tzbvRHBtJY09iF3tSfOg08IyGmD5iliWHXpJ8RyfyC5rr2ZDf7Uz58f6140DQMucGyomZiADqSejgP86ZnjUyNlAzdd7e+H4TNUa5I04cF7B09c12iyapWq82mhVOklQzjsJ5q+3sklLZNTyP6l98PwK20FyNL675c4dDbUC/Ud3WZMFLS2PV35P6k98m/02oPkf1J75oLgC06tIk3MeJrP/wCn1PJ/qT3zowFXyD9JPfNIyWHTG06R8Y7+qPE1nv8AT6vkf1J749NnVd+T+pPfNIlA9HthCJvsOyXE1lXwVUDxP6k98amEq38Q/ST3zVmjf0QinhQBGGstSw1XyD6198KGFqD5B+kvvmpp0eabBSQy2uAdLa7+uTNRXnWGmtjZT6iTeXxTyZanhankf1L75J+i1PI/qX3zTCkL6quUEWPH0/fOtTX5QUb72t4turjfdHieTMph38g+tffOV8G7Iy5bEgjUr75oGpjMdBbhbdbhGuotbq9cmGqLB7GVLFzdrbxuHUJYog4f/scq390dl6vbNCBqX/UHKcd0sWXq7D0wSuLGBWYvCZ3RixUoxYWAIJylQTccLmVlKgHxjkksKdNFuTxc5uFhuvNCSJV1MEgd3y3z2z6tYkCwut7Gw6pFE0vBA5eaD5KgX9Q1hBuRoh7TYSOggUWQC3UAPYJMH03Dsvv9PAwKrD7OCPUcNYu2ZhoQDlA003aSiw2GH6XikO4ik4+iwM0mJqjhKVkTwzub5mVVOpAIUkjQdpkV2vhE3EgdW8+rfNHyZ2bTS7hBdha5UX99pS0Ka3ulh1j7+mabAPZe/p7RMrQuO2emYuFUN0gajrB3j0TObPc5XuST4WrcnefhH3zTYqpxBmSpVVV3TOC5Z3y7jld2YG3rHolkiLDNFBvCRSivq4mwyjTs0lViDm3xRTlxkboAYYE3IsJZYWluA0HR/nGKKdIwvMJfcNAJb4YWE5FNIPWFU0vv3dEUUqHeCubx1rnTdFFAmXDk8ZKlICKKBLljkGs7FA4F1kltYooHSl4mWKKERkRqrOxQqMrYyNzYzsUCN5E/fOxQAqrkX/z/ADhBUqcDunIpFidDlPSDAdo43KbCKKRVS+IJNx6YM1ZidIopKqxwdQ+k2HuPdL7DV9LHfu6r8YopBHiX4HTfr/1MNynwfhCKikq6biDY2G+x/wA4xRQKintvEqALo1uLDnHtsZyKKbZf/9k="
    },
    {
      "title": "Twin room",
      "type": "Double Room",
      "price": 190,
      "rate": 4.1,
      "imageUrl":
          "data:image/jpeg;base64,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"
    },
    {
      "title": "Luxury room",
      "type": "Queen Room",
      "price": 200,
      "rate": 4.2,
      "imageUrl":
          "https://noithattrevietnam.com/uploaded/2019/12/3-thiet-ke-phong-ngu-khach-san-mini%20%285%29.jpg"
    },
    {
      "title": "King room",
      "type": "Single Room",
      "price": 240,
      "rate": 4.3,
      "imageUrl":
          "https://anviethouse.vn/wp-content/uploads/2021/12/Thiet-ke-phong-deluxe-khach-san-1-2.jpg"
    },
    {
      "title": "Queen room",
      "type": "Single Room",
      "price": 240,
      "rate": 4.5,
      "imageUrl":
          "https://queenannnhatrang.com//uploads/Roooms/slide-cover-premier-double%20(1).jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF7F7F7),
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_history,
                    color: Colors.grey[600],
                  ),
                  Container(
                    width: 4,
                  ),
                  Text(
                    "Hà Nội",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Stack(children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.grey[600],
                ),
              ),
              const Positioned(
                  top: 6,
                  right: 6,
                  child: Icon(Icons.brightness_1,
                      size: 10.0, color: Colors.redAccent)),
            ]),
            Container(
              width: 12,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tìm và đặt",
                style: TextStyle(
                    color: Colors.grey.shade500, fontWeight: FontWeight.w500),
              ),
              const Text(
                "Những phòng khách sạn tốt nhất",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 48,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: 2, bottom: 2, top: 2),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: locations
                      .map((e) => Container(
                            child: Text(e),
                            margin: e != locations[locations.length - 1]
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(right: 0),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Colors.grey.shade400.withOpacity(0.55),
                                    spreadRadius: .5,
                                    blurRadius: .5,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                          ))
                      .toList(),
                ),
              ),
              const Text(
                "Đặc sắc",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 8,
              ),
              CarouselSlider(
                items: roomItems
                    .map((e) => FeaturedItem(
                          title: e["title"],
                          type: e["type"],
                          price: e["price"],
                          imageUrl: e["imageUrl"],
                        ))
                    .toList(),
                options: CarouselOptions(
                    height: 260,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    clipBehavior: Clip.none),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Đề xuất cho bạn",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    "Xem tất cả",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 96,
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 4),
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  children: roomItems
                      .map((e) => Container(
                          margin: e != locations[locations.length - 1]
                              ? const EdgeInsets.only(right: 12)
                              : const EdgeInsets.only(right: 0),
                          child: RecommendedItem(
                            title: e["title"],
                            type: e["type"],
                            price: e["price"],
                            rate: e["rate"],
                            imageUrl: e["imageUrl"],
                          )))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
