# Dinamik Performans ve Hedef Sapma Analitiği (Target vs. Actual)

Perakende ve e-ticaret operasyonlarında, ürün kategorilerinin aylık hedeflerden (kotalardan) sapmasını ve yıldan yıla (YoY) büyüme/küçülme trendlerini anlık olarak takip eden, uçtan uca kurgulanmış bir İş Zekası (BI) ve Veri Modelleme projesidir.

## 🎯 İş Problemi (Business Case)
Bir şirketin en büyük finansal kör noktası, dönemsel hedefler ile gerçekleşen satışların farklı veritabanlarında dağınık halde durmasıdır. Bu durum, yönetim kurullarının operasyonel daralmaları veya hedef sapmalarını ancak ay sonu kapanış raporlarında (iş işten geçtikten sonra) fark etmesine yol açar. 

**Çözüm:** Bu projede, geçmiş satış verileri ile dinamik aylık hedefleri entegre eden kurumsal bir veri mimarisi simüle edilmiş ve karar alıcıların kırmızı alarm veren kategorileri anında görebileceği interaktif bir **Yönetici Paneli (Executive Dashboard)** inşa edilmiştir.

## 📐 Veri Modelleme Mimarisi (Star Schema)
Projede, veri tabanının şişmesini engellemek ve raporlama hızını maksimuma çıkarmak amacıyla **Şelale Kuralı (Single Cross-Filter)** uygulanmış, Fact tabloları arasındaki doğrudan bağlantılar elenmiştir.

![Star Schema Mimarisi](https://github.com/user-attachments/assets/a09453d0-7cc4-487a-9b94-71380dfe05a3)

* **Fact Tables (İşlem Tabloları):
* ** * `Fact_Gerceklesen_Satis` (Ciro, adet ve tarih bazlı satış hareketleri)
    * `Fact_Aylik_Hedef` (Yıl ve ay bazlı kurumsal kotalar)
* **Dimension Tables (Boyut/Filtre Tabloları):**
    * `Dim_Urun` (Tekil ürün kimlikleri ve kategoriler)
    * `Dim_Takvim` (DAX `CALENDARAUTO` ile üretilmiş kesintisiz zaman boyutu)

## 🧮 Geliştirilen DAX Metrikleri
Amatör veri analistlerinin aksine, tüm metrikler esnek ve ölçeklenebilir olması adına **Explicit Measure** olarak sıfırdan kodlanmıştır:

* **Toplam Ciro & Hedef:**
    ```dax
    Toplam Ciro = SUM(Fact_Gerceklesen_Satis[Ciro])
    Toplam Hedef = SUM(Fact_Aylik_Hedef[Hedef_Ciro])
    ```
* **Zaman Zekası (Geçmiş Dönem Kıyaslama):**
    ```dax
    Gecen Yil Ciro (LY) = CALCULATE([Toplam Ciro], SAMEPERIODLASTYEAR(Dim_Takvim[Date]))
    ```
* **Yıldan Yıla Büyüme Oranı (YoY):**
    ```dax
    Buyume Orani (YoY) = DIVIDE([Toplam Ciro] - [Gecen Yil Ciro (LY)], [Gecen Yil Ciro (LY)], 0)
    ```

## 📈 Elde Edilen Ticari Çıktılar (Executive Dashboard)
Geliştirilen dinamik performans tablosu sayesinde veriler çift yönlü filtreleme krizlerinden arındırılmış ve milyonlarca satırlık ortamlarda **0-gecikme (zero-latency)** ile çalışacak şekilde optimize edilmiştir.

![Executive Matrix Dashboard](https://github.com/user-attachments/assets/e2f24414-7385-4884-9dba-c16b8578600a)

**Stratejik İçgörüler:**
1.  **Yün Kazak** kategorisinde geçen yıla göre **%125 oranında agresif bir büyüme** kaydedildiği doğrulanmıştır.
2.  **Kışlık Kaban** kategorisinde satışlar geçen yıla oranla %90'lık bir büyüme gösterse de (`20.000 TL` vs `38.000 TL`), `22.000 TL` olarak belirlenen kotanın gerisinde kalındığı tespit edilmiştir.
