<img width="871" height="542" alt="image" src="https://github.com/user-attachments/assets/7206c337-01de-44cc-b862-7beecd398482" />

# E-Ticaret Fiyatlandırma ve Kârlılık Analizi

Bu projede amacım sadece güzel görünen bir grafik çizmek değil; bir e-ticaret şirketinin fiyatlandırma stratejisindeki kör noktaları bulmaktı.

Şirketlerde genelde "Çok satıyoruz ve ciromuz yüksek, demek ki kârlıyız" mantığı vardır. Peki ya rakiplerimiz aynı ürünü çok daha pahalıya satabiliyorsa ve biz fiyatımızı gereksiz yere düşük tutarak masada para bırakıyorsak? İşte bu projede bu görünmez zararı (kaçırılan kazanımı) ortaya çıkardım.

### Bu Projede Adım Adım Neler Yaptım?

1. **Veri Hazırlığı ve SQL Server:** Excel'de tutulan dağınık ürün, maliyet, satış ve rakip verilerini SQL Server'a aktardım. 
2. **SQL ile Matematiksel İşlemler:** `JOIN` kullanarak satış ve ürün tablolarını birleştirdim. Satış adedi, ciro ve maliyet üzerinden "Net Kâr" hesabını yapan SQL sorgusunu yazıp bunu bir View (Sanal Tablo) olarak kaydettim.
3. **Power BI ve Veri Modelleme:** SQL'deki verimi Power BI'a çektim ve rakip fiyatlarının olduğu tablo ile kendi satış tablom arasındaki anahtar bağlantıları (Data Modeling) kurdum.
4. **DAX ile Zarar Analizi:** `RELATED` fonksiyonunu kullanarak rakibin fiyatını kendi sistemime çektim. Ardından DAX formülleriyle "Eğer rakip fiyatından satsaydık ne kazanırdık?" matematiğini kurup **Kayıp Ciro** metriğini hesapladım.


