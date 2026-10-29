# gaps

## `guard` 'ın `else` bloğunda neden return yazmak gerekmedi?

Normalde `guard` bloğunun `else` kısmından çıkılması gerekir ancak `return` yazmak tek zorunlu seçenek değildir.
Swift, `else` bloğunun içinden çıkılacağını garanti eden bir kontrol akışı bekler.
`preconditionFailure` dönüş tipi `Never` olan bir fonksiyondur. Çağrılınca programı durdurur ve asla geri dönmez.
Derleyici bu yüzden `else` 'i kabul eder.

## Tutarı para formatıyla gösterme

```swift
Text(amount, format: .currency(code: "TRY"))
```

## Para için Double yerine neden Decimal?

`Double` ikilik tabanda çalışır ve `0.1` gibi değerleri tam tutamaz (`0.1 + 0.2` tam `0.3` etmez).
`Decimal` onluk tabanda çalışır ve para hesabı için daha güvenlidir.

**Dikkat!** `Decimal` bir veri `Double` veriden üretirsen kayıp geri gelebilir.
En güvenli yol metinden üretmektir. (`Decimal (string:)`)

## `NSDecimalRound(&rounded, &source, 2, .plain)` ne yapıyor?

`source` değişkenindeki ondalık sayıyı iki basamağa yuvarlar ve sonucu `rounded` değişkenine yazar.
`NSDecimalRound`, sonucu belirttiğimiz değişkene yazmak için `inout` parametreleri kullanır.
`&` işareti, ilgili değişkenin fonksiyon tarafından değiştirilebileceğini belirtir.

## Yuvarlama modları

`.plain` En yakın değere yuvarlar; tam ortadaysa sıfırdan uzağa yuvarlar.
`.bankers` En yakın değere yuvarlar; tam ortadaysa son basamağı çift olacak şekilde seçer.
`.down` Negatif sonsuza doğru yuvarlar.
`.up` Pozitif sonsuza doğru yuvarlar.

Swift'in `NSDecimalRound` fonksiyonunda kullanılan bu modlar `Decimal.RoundingMode` türündendir.

`hasValidDecimalPlaces` property'sinin amacı, kullanıcının tutarının iki ondalık basamakla temsil edilip edilemeyeceğini kontrol etmek. Tutarı gerçekten yuvarlayıp kaydetmek değil.

##

## @State ve private

**@State:** View'ın kendine ait, basit değer tipli verisi. Değer değişince SwiftUI `body`'yi yeniden hesaplar ve arayüzü günceller.

**private:** Değişkene yalnızca tanımlandığı kapsamın içinden erişilmesini sağlar (erişim kontrolü).

**Bağlantı:** `@State` verisinin sahibi view'ın kendisidir, dışarıdan değiştirilmemelidir. Bu yüzden genelde `@State private var` olarak yazılır.
