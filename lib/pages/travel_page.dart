import 'package:flutter/material.dart';

import '../components/appBar.dart';
import '../components/main_drawer.dart';
import '../components/tile_hover.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List data = [
    [
      'Masjid Istiqlal',
      '   Kalau datang ke Jakarta, nggak lengkap rasanya jika melewatkan kunjungan ke Masjid Istiqlal yang berdiri megah di kawasan Jakarta Pusat. Sebagai masjid terbesar di Asia Tenggara, popularitas masjid megah ini jelas sudah mendunia. Saking besarnya, bangunan Masjid Istiqlal mampu menampung jumlah jemaah hingga 200.000 orang, lho! Selain itu, Sobat Pesona juga wajib melihat keindahan suasana matahari terbenam di kawasan Masjid Istiqlal yang mewah dan instagrammable banget!',
      'https://v1.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/10-masjid-bergaya-arsitektur-paling-unik-di-indonesia-aja/istiqlal.jpeg'
    ],
    [
      'Masjid Raya Sumatra Barat',
      """
    Sobat Pesona tahu nggak, nih? Keindahan rumah gadang ternyata bukan hanya ada di kampung adat, tapi juga diabadikan lewat masjid indah bernama Masjid Raya Sumatra Barat atau yang dikenal dengan Masjid Mahligai Minang, lho!  Masjid ini adalah masjid terbesar di Sumatra Barat yang lokasinya berada di Kecamatan Padang Utara, Kota Padang, Provinsi Sumatera Barat.
      \n
    Uniknya, masjid ini tidak memiliki kubah pada umumnya, melainkan beratap khas budaya Minangkabau yang didesain seperti Rumah Gadang. Ada empat sudut lancip di atap masjid dengan bangunannya yang berbentuk gonjong. Ditambah lagi, ukiran Minang dan kaligrafi pada dinding bagian luar yang menyempurnakan keseluruhan arsitektur masjid. Selain itu, Masjid Raya Sumatra Barat juga mengabadikan kejadian peletakan batu Hajar Aswad dengan menggunakan kain yang dibawa oleh empat orang perwakilan suku di Kota Mekkah pada setiap sudutnya.
      """,
      'https://v1.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/10-masjid-bergaya-arsitektur-paling-unik-di-indonesia-aja/masjid-raya-sumatra-barat.jpeg'
    ],
    [
      'Masjid Agung An Nur',
      """
    Jika dilihat sekilas, masjid ikonik di Pekanbaru ini memiliki bentuk menyerupai salah satu ikon wisata India, Taj Mahal. Ya, memang tak bisa dipungkiri bahwa proses pembangunan destinasi religi andalan #DiIndonesiaAja tersebut dipengaruhi oleh unsur budaya India. Tak hanya itu, sentuhan Melayu yang kental juga bisa dirasakan berkat pemilihan warna hijau yang mendominasi bangunan masjid dan motif kubah serupa kain hias berlapis warna emas dalam songket Melayu.
      \n
    Pengunjung Masjid Agung An Nur juga akan semakin terkesima dengan kehadiran beranda dalam masjid, seperti yang biasanya menjadi salah satu ciri khas rumah panggung ala Melayu. Menikmati waktu santai sore di masjid unik seluas 12,6 hektare ini dijamin bakal puas banget!
      """,
      'https://v1.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/10-masjid-bergaya-arsitektur-paling-unik-di-indonesia-aja/agung-an-nur.jpeg'
    ],
    [
      'Masjid Al- Irsyad',
      """
    Arsitek yang merancang pembangunan Masjid Al- Irsyad yang terinspirasi dari bangunan Ka’bah di Mekkah ini adalah Ridwan Kamil. Dengan desain yang unik dan ramah lingkungan, nggak heran bila Masjid Al- Irsyad hingga kini telah memboyong tiga penghargaan bergengsi, antara lain ialah The Best 5 World Building of The Year 2010 untuk kategori Bangunan Religi dari National Frame Building Association, FuturArc Green Leadership Award tahun 2011 dari BCI Asia, dan Awards 2018 untuk kategori Bangunan Peribadatan.
      \n
    Keunikan masjid ini tak hanya bangunannya yang berbentuk kotak saja, tetapi desain arah kiblat juga sengaja dibiarkan tanpa dinding sehingga langsung berhadapan dengan pemandangan alam terbuka yang sejuk.
      """,
      'https://v1.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/10-masjid-bergaya-arsitektur-paling-unik-di-indonesia-aja/istiqlal.jpeg'
    ],
    [
      'Masjid Menara Kudus',
      """
    Masjid Menara Kudus merupakan bentuk akulturasi agama Hindu, Buddha, dan Islam. Pembuatan masjid ini tak terlepas dari peran besar Sunan Kudus yang merupakan salah satu walisongo, para penyebar agama Islam di Pulau Jawa. Masjid ini memiliki prasasti, gapura, menara dengan ukiran khas Jawa Kuno-Hindu, dan juga pancuran untuk wudhu yang diletakkan di arca berjumlah 8 pancuran, dengan dasar adaptasi dari keyakinan Buddha, yakni ‘Delapan Jalan Kebenaran’ atau Asta Sanghika Marga.
      \n\n
    Menjadi bentuk ragam toleransi dari berbagai agama, Masjid Menara Kudus juga wajib masuk ke daftar kunjungan masjid unik yang ada #DiIndonesiaAja!  
      """,
      'https://v1.indonesia.travel/content/dam/indtravelrevamp/en/trip-ideas/10-masjid-bergaya-arsitektur-paling-unik-di-indonesia-aja/masjid-menara-kudus.jpeg'
    ],
  ];

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Travel"),
      drawer: mainDrawer(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Assalamualaikum",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 18,
                color: Color(0xff8789A3),
              ),
            ),
            const Text(
              "Travel Religi",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Color(0xff240F4F),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTileHover(
                    name: data[index][0],
                    description: data[index][1],
                    imagePath: data[index][2]);
              },
            )),
          ],
        ),
      ),
    );
  }
}
