# TestScenarios.md

ExpenseTracker, Hafta 1 elle test senaryoları.

**Sonuç:** ✅ geçti · ❌ kaldı · ⚠️ beklenmedik ama sorun değil · ❓ doğrulanmadı

---

## Test ortamı

- Tarih: 26.10.2026
- Xcode sürümü: 27.0
- Simülatör / iOS sürümü: 27.0
- Commit: f7e79f6
- Cihaz dili / bölge: Türkçe / Türkiye

---

## Senaryolar

### S01 · Boş başlık

- Ne yaptım: Başlığı boş bıraktım, diğer alanları geçerli değerlerle doldurdum.
- Ne bekledim: Kaydetme işlemi başarısız olmalı.
- Ne oldu: Kaydet butonu aktif olmadı.
- Sonuç: ✅

### S02 · Yalnızca boşluk veya satır sonu içeren başlık

- Ne yaptım: Başlığa yalnızca boşluk ve/veya satır sonu girdim, diğer alanlar geçerli.
- Ne bekledim: Kaydetme işlemi başarısız olmalı.
- Ne oldu: Kaydet butonu aktif olmadı.
- Sonuç: ✅

### S03 · Tutar boş, 0 ve negatif

- Ne yaptım: Başlığı doldurdum, tutarı sırasıyla boş, 0 ve negatif değerle denedim.
- Ne bekledim: Kaydetme işlemi başarısız olmalı.
- Ne oldu: Kaydet butonu aktif olmadı.
- Sonuç: ✅
- Not: Negatif değer girişi yapılamıyor. (decimalPad'de eksi tuşu yok)

### S04 · Geçmiş, bugün ve gelecek tarihli harcama

- Ne yaptım: Üç ayrı tarihli harcama ekledim.
- Ne bekledim: Liste en yeniden en eskiye doğru sıralanmalı.
- Ne oldu: Üçü de kaydedildi, tarihler doğru, liste yeniden eskiye sıralı.
- Sonuç: ✅

### S05 · Filtre açıkken aynı kategoriye ekleme

- Ne yaptım: Ulaşım filtresi seçiliyken ulaşım kategorisinden harcama ekledim.
- Ne bekledim: Yeni eklenen harcama listede görünmeli.
- Ne oldu: Yeni harcama filtrede doğru göründü, filtre değişince yanlış görünüm olmadı.
- Sonuç: ✅

### S06 · Filtre açıkken silme

- Ne yaptım: Yeme & İçme filtresinde bir harcamayı sildim, sonra Tümü'ne döndüm.
- Ne bekledim: Silinen harcama listede görünmemeli.
- Ne oldu: Yalnızca seçtiğim harcama silindi, Tümü'nde de görünmüyor.
- Sonuç: ✅

### S07 · Silip uygulamayı kapatıp açma

- Ne yaptım: Birkaç harcamadan birini sildim, uygulamayı kapatıp açtım.
- Ne bekledim: Kalıcı silme olmalı, veri geri dönmemeli.
- Ne oldu: Silinen görünmüyor, diğerleri korunuyor.
- Sonuç: ✅

### S08 · Çok uzun başlık

- Ne yaptım: 200-300 karakterlik başlık girmeyi denedim.
- Ne bekledim: Uzun başlık kabul edilir, listede görünür.
- Ne oldu: 300 karakter kabul edildi, ExpenseRow alt alta gösterdi.
- Sonuç: ⚠️
- Not: Uzun metin yapıştırılamadı. Klavyeyle 300 karaktere kadar yazıp tekrar denedim.
- Hata kaydı: H03

### S09 · Çok büyük tutar

- Ne yaptım: 99999999999999999,99 girdim.
- Ne bekledim: Veri doğru şekilde kaydedilmeli.
- Ne oldu: Toplam doğru, kapatıp açınca da doğru.
- Sonuç: ✅

### S10 · Filtre açıkken farklı kategoriden harcama ekleme

- Ne yaptım: Herhangi bir kategori filtreliyken farklı bir kategoriden harcama ekledim.
- Ne bekledim: Yeni harcama kaydedilir ve listede görünür.
- Ne oldu: Kaydedildi ama filtrede görünmedi, filtreyi kaldırınca göründü.
- Sonuç: ❌
- Hata kaydı: H01
- Yeniden test: ✅

### S11 · Tutarda 2 basamaktan fazla ondalık

- Ne yaptım: 0,001 ve 1,999 girdim.
- Ne bekledim: 2 basamaktan fazla ondalık reddedilir.
- Ne oldu: 0,001 → ₺0,00 olarak göründü, 1,999 → ₺2,00 göründü.
- Sonuç: ❌
- Hata kaydı: H02
- Yeniden test: ✅

### S12 · Yapıştırma ile uzun ve negatif giriş

- Ne yaptım: Uzun metni ve negatif değeri yapıştırmayı denedim.
- Ne bekledim: Uzun metin ve negatif değer yapıştırılıp kaydı denenir.
- Ne oldu: Simülatör yapıştırmaya izin vermedi.
- Sonuç: ❓

---

## Bulunan hatalar

### H01 · Filtre açıkken eklenen harcama görünmüyor

- Hangi senaryo: S10
- Nasıl tekrarlanır: Filtre Ulaşım iken Yeme & İçme harcaması ekle.
- Neden: Yeni harcama listeye giriyor ama filtre onu gizliyor.
- Karar: Kullanıcının bilinçli seçimi korunmalı bu yüzden kullanıcıya bilgi verelim.
- Düzeltme: Kullanıcıya girdiği verinin kaydedildiğini bildiren banner gösteriliyor. "Tümünü Göster" butonu ile filtre kaldırılabiliyor.
- Commit: feat: notify when saved expense is hidden by filter

### H02 · Tutar yuvarlanmadan saklanıyor

- Hangi senaryo: S11
- Nasıl tekrarlanır: 0,001 veya 1,999 gir, kaydet.
- Neden: Görünüm yuvarlıyor, saklanan değer yuvarlanmıyor. isValid 0,001'i geçerli sayıyor.
- Karar: Yuvarlamak bana göre doğru değil çünkü kullanıcı girdisi sessizce değişmemeli.
- Düzeltme: Kullanıcı üçüncü ondalık basamağı girdiğinde Kaydet pasif oluyor ve uyarı mesajı gösteriliyor.
- Commit: fix: reject amounts with more than two decimals

### H03 · Uzun başlık listeyi uzatıyor

- Hangi senaryo: S08
- Nasıl tekrarlanır: 200-300 karakterli harcama başlığı gir, kaydet.
- Neden: Liste gereksiz uzuyor.
- Karar: Kullanıcı girişine sınır koymadım. Bunun yerine harcama başlığını iki satıra kısaltıyorum.
- Düzeltme: ExpenseRow'da başlığa lineLimit(2) eklendi.
- Commit: fix: limit expense title to two lines in list

---

## Özet

- Toplam senaryo: 12
- Geçti (ilk denemede): 8 (S01–S07, S09)
- Kaldı: 2 (S10, S11), ikisi de düzeltildi ve yeniden test edildi.
- Beklenmedik ama sorun değil: 1 (S08)
- Doğrulanmadı: 1 (S12)
- Düzeltilen hata sayısı: 3
- Açık kalan: S12 yapıştırma testi, kısaltılan başlığın tamamı görünmüyor, eski kayıtları düzeltme seçeneği yok.

**Bu testten öğrendiğim en önemli şey:** Tek tek özellikleri test etmek yetmiyor. Asıl hatalar iki ya da daha fazla özelliğin birlikte çalıştığı (filtre ve ekleme) ya da ekranın saklanan veriyle ayrıştığı (yuvarlama) yerlerde çıktı.

**Yazmayı unuttuğum senaryo türü:** Özelliklerin birleşimi, arka plana alıp dönme ve farklı bölge ayarında (nokta/virgül) kullanım.
