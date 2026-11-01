# gaps

Hafta 1'de karşıma çıkan konular. Her konunun altında soru ve kısa açıklama var.

## `guard` 'ın `else` bloğunda neden return yazmak gerekmedi?

Normalde `guard` bloğunun `else` kısmından çıkılması gerekir ancak `return` yazmak tek zorunlu seçenek değildir.
Swift, `else` bloğunun içinden çıkılacağını garanti eden bir kontrol akışı bekler.
`preconditionFailure` dönüş tipi `Never` olan bir fonksiyondur. Çağrılınca programı durdurur ve asla geri dönmez.
Derleyici bu yüzden `else` 'i kabul eder.

## Tutarı para formatıyla nasıl gösteririm?

```swift
Text(amount, format: .currency(code: "TRY"))
```

Tutarı para birimi ve cihaz bölgesine göre biçimlendirir, saklanan değeri değiştirmez.

## Para için Double yerine neden Decimal?

`Double` ikilik tabanda çalışır ve `0.1` gibi değerleri tam tutamaz (`0.1 + 0.2` tam `0.3` etmez).
`Decimal` onluk tabanda çalışır ve para hesabı için daha güvenlidir.

**Dikkat!** `Decimal` değeri `Double` bir değerden üretirsen kayıp geri gelebilir.
En güvenli yol metinden üretmektir. (`Decimal(string:)`)

## `NSDecimalRound(&rounded, &source, 2, .plain)` ne yapıyor?

`source` değişkenindeki ondalık sayıyı iki basamağa yuvarlar ve sonucu `rounded` değişkenine yazar.
`NSDecimalRound`, sonucu belirttiğimiz değişkene yazmak için `inout` parametreleri kullanır.
`&` işareti, ilgili değişkenin fonksiyon tarafından değiştirilebileceğini belirtir.

## Yuvarlama modları

`.plain` En yakın değere yuvarlar; tam ortadaysa sıfırdan uzağa yuvarlar.
`.bankers` En yakın değere yuvarlar; tam ortadaysa son basamağı çift olacak şekilde seçer.

Swift'in `NSDecimalRound` fonksiyonunda kullanılan bu modlar `Decimal.RoundingMode` türündendir.

## `hasValidDecimalPlaces` ne yapıyor?

`hasValidDecimalPlaces` property'sinin amacı, kullanıcının tutarının iki ondalık basamakla temsil edilip edilemeyeceğini kontrol etmek.
Tutarı gerçekten yuvarlayıp kaydetmek değil. Bu yüzden yuvarlama modunun ne olduğu önemsiz.

## `isValid` varken Kaydet'te neden yine `guard let`?

`isValid`, formdaki bilgilerin geçerli olup olmadığını kontrol ederek Kaydet butonunun etkin olup olmayacağını belirler. `guard let amount, amount > 0` kayıt işlemi sırasında tutarın `nil` olmadığını ve sıfırdan büyük olduğunu kontrol eder; ayrıca `amount` değerini `Decimal?` türünden `Decimal` türüne dönüştürerek güvenle kullanmamızı sağlar.

## `.tag(option as Category?)` neden optional?

Sebebi `Picker` seçimimizin `Category?` türünde olmasıdır.
Yani `selectedCategory` hem bir kategori (`.food`, `.transport` gibi) hem de `nil` değerini alabilir.
`option as Category?` ile normal kategori değerini optional türe dönüştürerek `Picker`'ın seçim türüyle eşleştiriyoruz.
Kısacası, `?` sayesinde belirli bir kategori seçebildiğimiz gibi `nil` değeriyle tüm kategorileri de gösterebiliyoruz.

## `onChange(of: expenses)` neden `Equatable` istedi?

`onChange(of:)` izlediği değerin değişip değişmediğini anlayabilmek için eski ve yeni değerleri karşılaştırmak zorundadır. Swift'te bu karşılaştırmayı yapabilmek için ilgili türün `Equatable` protokolüne uyması gerekir.

## `@State` ne işe yarar?

View'ın kendine ait, değer tipli verisidir. Değer değişince SwiftUI `body`'yi yeniden hesaplar ve arayüzü günceller.
Değişkene yalnızca tanımlandığı kapsamın içinden erişilmesini sağlamak için `private` yazılır.

## Sheet'i nasıl kapatırım?

SwiftUI'da bir `sheet`'i kapatmak için en yaygın yöntem `@Environment(\.dismiss)` kullanmaktır.

- Önce sheet olarak açılan view'ın içinde dismiss tanımlıyoruz:
`@Environment(\.dismiss) private var dismiss`
- Kapatmak istediğimiz yerde çağırıyoruz:
`Button("İptal") { dismiss() }`

## Form, `expenses` dizisini bilmeden harcamayı nasıl iletir?

Form harcamayı oluşturur, `onSave` ile teslim eder; ana ekran harcamayı nereye ekleyeceğine karar verir.

## En çok zorlayan 3 konu

- Para hesabı (`Decimal`, yuvarlama)
- SwiftUI parantez yapısı(`toolbar`, `Menu`, `label`)
- Optional (optional seçim ve `.tag`)
